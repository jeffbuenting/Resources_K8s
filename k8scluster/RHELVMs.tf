terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
      version = "2.2.0"
    }
  }
}

provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "datacenter" {
  name = var.VMDatacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.vmCommon.Datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.VMCluster
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = var.vmCommon.Network
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
  name          =var.vmCommon.Template
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_virtual_machine" "vm" {

  for_each = var.VMs

  name             = each.value.Name
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  folder           = each.value.Folder
  num_cpus         = each.value.CPU
  memory           = var.VMConfig.RAM
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    
    customize {
      linux_options {
        host_name = each.value.Name
        domain    = each.value.Domain
      }

      network_interface {
      }
    }
  }

  connection {
    type = "ssh"
    user = var.AdminAcct
    password = var.AdminPW
    host = self.default_ip_address
  }

  provisioner "remote-exec" {
    inline = [
      "echo ${var.AdminPW} | sudo -S subscription-manager register --username ${var.RHEL_Sub_user} --password ${var.RHEL_Sub_PW} --auto-attach",
      "echo ${var.AdminPW} | sudo -S yum update -y"
    ]
  }

  
}