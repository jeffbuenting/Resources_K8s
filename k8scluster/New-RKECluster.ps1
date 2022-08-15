$Cred = Get-Credential -Message "vCenter account"
$vCenterServer = "192.168.1.15"

$UserCred = Get-Credential -Message "linux account"
$RHELSubCred = Get-Credential -Message "RHEL subscription account"

terraform plan -var vsphere_user="$($Cred.UserName)" `
    -var vsphere_password="$($Cred.GetNetworkCredential().Password)" `
    -var vsphere_server=$vCenterServer `
    -var AdminAcct="$($UserCred.UserName)" `
    -var AdminPW="$($UserCred.GetNetworkCredential().Password)" `
    -var RHEL_Sub_user="$($RHELSubCred.UserName)" `
    -var RHEL_Sub_PW="$($RHELSubCred.GetNetworkCredential().Password)" `
    -var K3STOKEN="ThisIsTheTokenforK3SCluster." `
    -var Role="master"

terraform apply -var vsphere_user="$($Cred.UserName)" `
    -var vsphere_password="$($Cred.GetNetworkCredential().Password)" `
    -var vsphere_server=$vCenterServer `
    -var AdminAcct="$($UserCred.UserName)" `
    -var AdminPW="$($UserCred.GetNetworkCredential().Password)" `
    -var RHEL_Sub_user="$($RHELSubCred.UserName)" `
    -var RHEL_Sub_PW="$($RHELSubCred.GetNetworkCredential().Password)" `
    -var K3STOKEN="ThisIsTheTokenforK3SCluster." `
    -var Role="master"

terraform destroy -var vsphere_user="$($Cred.UserName)" `
    -var vsphere_password="$($Cred.GetNetworkCredential().Password)" `
    -var vsphere_server=$vCenterServer `
    -var AdminAcct="$($UserCred.UserName)" `
    -var AdminPW="$($UserCred.GetNetworkCredential().Password)" `
    -var RHEL_Sub_user="$($RHELSubCred.UserName)" `
    -var RHEL_Sub_PW="$($RHELSubCred.GetNetworkCredential().Password)" `
    -var K3STOKEN="ThisIsTheTokenforK3SCluster." `
    -var Role="master"