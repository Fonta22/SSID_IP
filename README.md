# SSID_IP

**Rubber Ducky** payload to extract the **SSID profiles** and the **IP addresses** of a **Windows machine**.

## Rubber Ducky Payload

- Opens **PowerShell**
- Downloads [SSID_IP.ps1](https://github.com/Fonta22/SSID_IP/blob/main/SSID_IP.ps1)
- Sets the PowerShell **Execution Policy** to **Unrestricted** (forced)
- **Runs** the script
- **Deletes** the script after it has run

> See the [payloads](https://github.com/Fonta22/SSID_IP/tree/main/payloads) folder.

## PowerShell Script Payload

[SSID_IP.ps1](https://github.com/Fonta22/SSID_IP/blob/main/SSID_IP.ps1) PowerShell Script.

This script exports the **SSID profiles** saved in the target machine, in **XML** files. Using PowerShell commands and making a Web Request, gets the private and public IP address and the Host Name of the machine. This data gets stored in a CSV file.

After, compresses all the files into a **Zip** file.

```
📂SSID_Profiles.zip
┣ 📜Wi-Fi-WIFI_1.xml
┣ 📜Wi-Fi-WIFI_2.xml
┣ 📜Wi-Fi-WIFI_3.xml
┗ 📜IP_Addresses.csv
```

### CSV Example

| Host Name  | Public IP   | Private IP    |
|------------|-------------|---------------|
| HOSTNAME   | `X.X.X.X`   | `192.168.X.X` |

## Exctracting data from XML

To exctract the important data from the XML files, run [Extract-SSID.py](https://github.com/Fonta22/SSID_IP/blob/main/extract/Extract-SSID.py), located in the `extract/` directory.

This script will create a **CSV** file with all the important data in the XML files.

When running it, you can specify the path where the XML files are. If you don't specify any, it will search for XML files in the directory where you run the script.

### Example

We have a directory called `Profiles/` with 4 SSID Profiles, in XML files.

```
📂Profiles
┣ 📜Wi-Fi-Home.xml
┣ 📜Wi-Fi-Mi 11i.xml
┗ 📜Wi-Fi-iPhone 6s.xml
```

To extract the data from those XML files, we will run the script, specifying the `Profiles/` directory.

```powershell
$ python Extract-SSID.py ./Profiles/
```

This will generate a **CSV** file, that will look like this.

| Name      | Key Material    | Protected |
|-----------|-----------------|-----------|
| Home      | home_key_2022   | False     |
| Mi 11i    | redmi2021       | False     |
| iPhone 6s | Xavier1971      | False     |

- `Name` - SSID Name
- `Key Material` - SSID Key
- `Protected` - True / False