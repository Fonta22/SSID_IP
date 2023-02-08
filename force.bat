curl -o SSID_IP.ps1 https://raw.githubusercontent.com/Fonta22/SSID_IP/main/SSID_IP.ps1
powershell -command "Set-ExecutionPolicy -Scope Process Unrestricted -force; .\SSID_IP; rm .\SSID_IP.ps1"
