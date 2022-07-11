variable vsphere_user {
    description = "vCenter User"
    type = string
}

variable vsphere_password {
    description = "vCenter User password."
    type = string
}

variable vsphere_server {
    description = "vCenter Server"
    type = string
}

variable VMDatacenter {
    description = "VM Datacenter"
    type = string
    default = "KW-HQ"
}

variable ISODatastore {
    description = "Datastore that contains the ISO files"
    type = string
    default = "NFS-Drobo"
}

variable VMCluster {
    description = "vCenter Cluster"
    type = string
    default = "KWVMwareCluster01"
}

# ----- VM Settings

variable VMConfig {
    description = "VM Config"
    type = map
    default = {
        Name = "KW-K8s-01"
        Domain = "localdomain"
        Folder = "K8s"
        CPU = 2
        RAM = 4096
        Network = "192.168.1.x"
        Datastore = "Local-14-R10"
        Template = "RHEL9_T"
    }    
}

variable "AdminAcct" {
    type = string
}

variable "AdminPW" {
    type = string
}

variable "RHEL_Sub_user" {
    type = string
}

variable "RHEL_Sub_PW" {
    type = string
}