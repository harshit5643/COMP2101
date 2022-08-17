Param (
    [switch]$Disks, [switch]$Network , [switch]$System
)

Write-Output "system details "
if ($Disks -ne $true -and $Disks -ne $true -and $Network -ne $true) {
   computersysteminfo
   operatingsystem
   processor
   Ram
   diskdrive
   networkadapter
   video
}

if ($Disks -eq $true) {
    diskdrive
}

Write-Output "Network details"
if($Network -eq 'true'-Or $Network -ne 'true'){
   networkadapter
}
break

"Output info"


