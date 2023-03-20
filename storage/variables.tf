variable "nfsserver" {
  description = "NFS server name or IP"
  type        = string
}

variable "nfsshare" {
  description = "full share path"
  type        = string
}

variable "storageclassname" {
  description = "name of new storage class"
  type        = string
}
