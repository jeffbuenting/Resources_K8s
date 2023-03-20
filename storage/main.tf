provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }

  # # localhost registry with password protection
  # registry {
  #   url = "oci://localhost:5000"
  #   username = "username"
  #   password = "password"
  # }
}

resource "helm_release" "nfs" {
  name       = "nfs"
  repository = "https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/"
  chart      = "nfs-subdir-external-provisioner"

  set {
    name  = "nfs.server"
    value = var.nfsserver
  }

  set {
    name  = "nfs.path"
    value = var.nfsshare
  }

  set {
    name  = "storageClass.name"
    value = var.storageclassname
  }
}
