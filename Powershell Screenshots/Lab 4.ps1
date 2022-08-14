function computersysteminfo {
Write Output "========Compute Hardware Inforamtion========="
Get-WmiObject Win32_ComputerSystem| format-list
}

function operatingsystem {
Write Output "======Operating system Info======="
get-WimObject Win32_operatingsystem | format-list Name, version
}
processor info
function processor {
Write-output "========Processor Details====="
get-CimInstance -Class win32_processor | fl Description, MaxClockSpeed, NumberOfCores,
@{n="L1CacheSize";e={switch($_.L1CacheSize){$null{$OutputVariable="data unavailable";$OutputVariable}};
if($null -ne $_.L1CacheSize){$_.L1CacheSize}}}, L2CacheSize, L3CacheSize
}
Ram info
function Ram {
Write Output "=====RAM info======"
$totalcapacity = 0
get-WmiObject -Class win32_physicalmemory |
forEach-Object {
$currentRam = $_;
New-Object -TypeName psobject -Property @{
Manufacturer = $currentRam.Manufacturer
Description = $_currentRam.description
"Size(GB)" = $currentRam.Capacity/1gb
Bank = $currentRam.banklabel
Slot = $currentRam.Devicelocator
}
$totalcapacity += $currentRam.capacity
} |
Format-table Manufacturer, Description, "Size(GB)", Bank, Slot -AutoSize
Write Output "Total RAM Capacity = ${totalcapacity/1gb}GB"
}
ram
function diskdrive {
Write Output "=====Physical drive details====="
$diskdrives = Get-CimInstance CIM_diskdrive

  foreach ($disk in $diskdrives) {
      $partitions = $disk|get-cimassociatedinstance -resultclassname CIM_diskpartition
      foreach ($partition in $partitions) {
            $logicaldisks = $partition | get-cimassociatedinstance -resultclassname CIM_logicaldisk
            foreach ($logicaldisk in $logicaldisks) {
                     new-object -typename psobject -property @{Manufacturer=$disk.Manufacturer
                                                               Location=$partition.deviceid
                                                               Drive=$logicaldisk.deviceid
                                                               "Size(GB)"=$logicaldisk.size / 1gb -as [int]
                                                               }
           }
      }
  }
  }
diskdrive
function networkadapter {
Write-Output "=====Network adapter information"
get-ciminstance win32_networkadapterconfiguration | where { $_.ipenabled -eq "True"} | Format-table Description, Index, IPAddress, IPSubnet, dnsdomain, dnsserversearchorder
} 

networkadapter
function video {
Write-Output "=====video resolution in details======="
$carobject = Get-Wmiobject win32_Videocontroller
$carobject = New-Object -TypeName psObject -Property @{
Name             = $carobject.Name
Description      = $carobject.Description
ScreenResolution = [string]($carobject.currentHorizontalResolution) + 'px X' + [string]($carobject.currentVerticalResolution) + 'px'
} | Format-List Name, Description, ScreenResolution
$carobject
}
"======Output========"

