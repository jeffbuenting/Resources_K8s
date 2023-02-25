
terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
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

module "K3s_Nodes" {
  source = "../../../TF_MODULE_K3s"

  # vsphere_user     = var.vsphere_user
  # vsphere_password = var.vsphere_password
  # vsphere_server   = var.vsphere_server

  VMDatacenter = var.VMDatacenter
  # ISODatastore = var.ISODatastore
  VMCluster       = var.VMCluster
  VMDatastore     = var.VMDatastore
  vmname          = var.vmname
  vmnetwork       = var.vmnetwork
  vmfolder        = var.vmfolder
  num_cpus        = var.num_cpus
  ram             = var.ram
  vmtemplate      = var.vmtemplate
  domain          = var.domain
  vmuser_data     = var.vmuser_data
  vmmetadata      = var.vmmetadata
  k3smasternode   = var.k3smasternode
  adminuser       = var.adminuser
  adminpassword   = var.adminpassword
  ssh_rsa_keyfile = var.ssh_rsa_keyfile
  userprofile     = var.userprofile
}
