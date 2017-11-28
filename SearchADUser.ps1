$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://server_name/PowerShell/ -Authentication Kerberos -Credential $UserCredential
Import-PSSession -Session $Session -CommandName Get-Mailbox -AllowClobber

if (Test-Path C:\Users\username\Documents\ADusers-output.txt) {
    Remove-Item C:\Users\username\Documents\ADusers-output.txt
}


# C:\Users\username\Documents\ADusers.txt
$ADUsers = ForEach ($user in $(Get-Content C:\Users\username\Documents\ADusers.txt)) {

    Get-AdUser -Filter {Name -eq $user} -Properties Name
        
}

$exchangeUsers = ForEach ($user in $(Get-Content C:\Users\username\Documents\ADusers.txt)) {

    Get-Mailbox -Identity $user
        
}

if ($exchangeUsers.Count -gt 0) {
    Add-Content C:\Users\username\Documents\ADusers-output.txt "--== Exchange ==--`n" 
    $exchangeUsers |
    Select-Object Name |
    Add-Content C:\Users\username\Documents\ADusers-output.txt
    Add-Content C:\Users\username\Documents\ADusers-output.txt "`n"
}

if ($ADUsers.Count -gt 0) {
Add-Content C:\Users\username\Documents\ADusers-output.txt "`n--== Active Directory ==--`n"
    $ADUsers |
    Select-Object Name |
    Add-Content C:\Users\username\Documents\ADusers-output.txt
    Add-Content C:\Users\username\Documents\ADusers-output.txt "`n"
}


if (Test-Path C:\Users\username\Documents\ADusers-output.txt) {
    Start-Process "notepad" -ArgumentList "C:\Users\username\Documents\ADusers-output.txt"
} else {
    Clear-Host
    Write-Host(" ")
    Write-Host("No Users Found")
    Write-Host(" ")
    Write-Host(" ")
    Pause
}