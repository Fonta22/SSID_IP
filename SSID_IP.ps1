$IP_Zip = "IP_Addresses.zip"
$SSID_Zip = "SSID_Profiles.zip"

netsh wlan export profile key=clear
Compress-Archive -U -Path .\Wi-Fi*.xml -DestinationPath $SSID_Zip
rm .\Wi-Fi*.xml

$Public = (Invoke-WebRequest -uri "http://ifconfig.me/ip").Content

$Private = (Get-NetIPAddress | Where-Object {$_.AddressState -eq "Preferred" -and $_.ValidLifetime -lt "24:00:00"}).IPAddress

$HostName = [System.Net.Dns]::GetHostByAddress($Private).Hostname

"Host Name,Public IP,Private IP`n$HostName,$Public,$Private" | Out-File -FilePath .\IP_Addresses.csv

Write-Host "Saved IP Addresses to: IP_Addresses.csv"
Write-Host "Saved SSID Profiles to: SSID_Profiles.zip"