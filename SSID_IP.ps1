$IP_Zip = "IP_Addresses.zip"
$SSID_Zip = "SSID_Profiles.zip"

netsh wlan export profile key=clear
Compress-Archive -U -Path .\*.xml -DestinationPath $SSID_Zip
rm .\*.xml

(Invoke-WebRequest -uri "http://ifconfig.me/ip").Content | Out-File -FilePath .\Public.log

$Private = (Get-NetIPAddress | Where-Object {$_.AddressState -eq "Preferred" -and $_.ValidLifetime -lt "24:00:00"}).IPAddress
$Private | Out-File -FilePath .\Private.log

[System.Net.Dns]::GetHostByAddress($Private).Hostname | Out-File -FilePath .\HostName.log

Compress-Archive -U -Path .\*.log -DestinationPath $IP_Zip
rm .\*.log

Write-Host "Saved IP Addresses to: $IP_Zip"
Write-Host "Saved SSID Profiles to: $SSID_Zip"
