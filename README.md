# SSID_IP
**Rubber Ducky** payload to extract the **SSID profiles** and the **IP addresses** of a **Windows machine**.

## Payload

- Open **PowerShell**
- Download [SSID_IP.ps1](https://github.com/Fonta22/SSID_IP/blob/main/SSID_IP.ps1)
- Set the PowerShell **Execution Policy** to **Unrestricted** (forced)
- **Run** the script
- **Delete** the script after it has run

## PowerShell Script
[SSID_IP.ps1](https://github.com/Fonta22/SSID_IP/blob/main/SSID_IP.ps1) PowerShell Script.

This script extracts the **SSID profiles** saved in the target machine, in **XML** files, and compresses them into a **Zip** file.

After, using PowerShell commands and makinga Web Request, gets the private and public IP address and the Host Name of the machine. This data gets stored in a CSV file.

```
📂SSID_Profiles.zip
 ┣ 📜Wi-Fi-WIFI_1.xml
 ┣ 📜Wi-Fi-WIFI_2.xml
 ┗ 📜Wi-Fi-WIFI_3.xml
📜IP_Addresses.csv
```