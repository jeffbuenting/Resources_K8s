# $Cred = Get-Credential
# $vCenterServer = "192.168.1.15"

$UserCred = Get-Credential
$RHELSubCred = Get-Credential

terraform apply -var vsphere_user="$($Cred.UserName)" `
    -var vsphere_password="$($Cred.GetNetworkCredential().Password)" `
    -var vsphere_server=$vCenterServer `
    -var AdminAcct="$($UserCred.UserName)" `
    -var AdminPW="$($UserCred.GetNetworkCredential().Password)" `
    -var RHEL_Sub_user="$($RHELSubCred.UserName)" `
    -var RHEL_Sub_PW="$($RHELSubCred.GetNetworkCredential().Password)"

terraform destroy -var vsphere_user="$($Cred.UserName)" `
    -var vsphere_password="$($Cred.GetNetworkCredential().Password)" `
    -var vsphere_server=$vCenterServer `
    -var AdminAcct="$($UserCred.UserName)" `
    -var AdminPW="$($UserCred.GetNetworkCredential().Password)" `
    -var RHEL_Sub_user="$($RHELSubCred.UserName)" `
    -var RHEL_Sub_PW="$($RHELSubCred.GetNetworkCredential().Password)"