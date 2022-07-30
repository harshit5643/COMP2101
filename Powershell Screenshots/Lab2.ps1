# Lab 2 COMP2101 welcome script for profile
ls alias:np
new-item -path alias:np -value notepad | out-null;
function welcome {
write-output "welcome to Harshit computer $env:computername Overload $env:username"
$now = get-date -format 'HH:MM tt on dddd'
write output according to "It is $now."
};
function get-cpuinfo {
Get-Ciminstance -ClassName cim_processor | fl Manufacturer, Name, CurrentClockSpeed, MaxClockSpeed, NumberOfCorse
};
function get-mydisks {
Get-PhysicalDisk | ft Manufacturer, Model, SerialNumber, FirmwareVersion, Size
};
Welcome.