Write-Host "Network information"
get-ciminstance win32_networkadapterconfiguration |
where { $_.ipenabled -eq "True" } | 
Format-Table Description, Index, IPAddress, IPSubnet, DNSDomain, DNSServerSearchOrder 
ft