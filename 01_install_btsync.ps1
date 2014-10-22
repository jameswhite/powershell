Invoke-WebRequest "http://download.getsyncapp.com/endpoint/btsync/os/windows64/track/stable" -OutFile "C:\Users\Administrator\Desktop\Bittorrent_Sync.exe"
mkdir C:\Users\Administrator\btsync

# Add to our trusted sites
Try {
    $SiteName = "security_Bittorrent_Sync.exe"
    $RegItem_Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\EscDomains\" + $SiteName
    If((Test-Path $RegItem_Path) -eq $True) {
        Write-Host $SiteName "already exists in trusted sites"
        }
    Else {
        New-Item $RegItem_Path
        New-ItemProperty -Path $RegItem_Path -Name about -Value 2 -PropertyType DWord }
    Write-Host  "Script Check passed"
}
Catch {
    Write-Host  "Script Check Failed"
    Exit 1001
}

# They keep changing it.
Try {
    $SiteName = "security_BTSync.exe"
    $RegItem_Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\EscDomains\" + $SiteName
    If((Test-Path $RegItem_Path) -eq $True) {
        Write-Host $SiteName "already exists in trusted sites"
        }
    Else {
        New-Item $RegItem_Path
        New-ItemProperty -Path $RegItem_Path -Name about -Value 2 -PropertyType DWord }
    Write-Host  "Script Check passed"
}
Catch {
    Write-Host  "Script Check Failed"
    Exit 1001
}

C:\Users\Administrator\Desktop\Bittorrent_Sync.exe /PERFORMINSTALL 1 /AUTOMATION
