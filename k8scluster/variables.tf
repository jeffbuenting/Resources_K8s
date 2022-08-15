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

# ----- With a standalone single node VMWare cluster use the host name / IP for the Cluster Name
variable VMCluster {
    description = "vCenter Cluster"
    type = string
    default = "192.168.1.14"
}

# ----- VM Settings
variable VMCommon {
    type = map
    default = {
        Datastore = "Local-14-R10"
        Network = "192.168.1.x"
        Template = "RHEL9_T"
    }
}

variable VMs {
    description = "VM Configs"
    type = list(object({
        Name=string,
        Domain=string,
        Folder=string,
        CPU=number,
        RAM=number,
        K3sRole=string
    }))

    default = [
        {
            Name = "KW-k8s-10"
            Domain = "localdomain"
            Folder = "PaaS/Prod"
            CPU = 2
            RAM = 4096
            K3sRole = "master"
        },  

        {
            Name = "KW-k8s-11"
            Domain = "localdomain"
            Folder = "PaaS/Prod"
            CPU = 2
            RAM = 4096
            K3sRole = "master"
        },

        {
            Name = "KW-k8s-12"
            Domain = "localdomain"
            Folder = "PaaS/Prod"
            CPU = 2
            RAM = 4096
            K3sRole = "master"
        }
    ]
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

variable "Role" {
    type=string
}

variable "K3STOKEN" {
    type=string
}