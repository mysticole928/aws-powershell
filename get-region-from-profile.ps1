# This PowerShell command will reach into your profile and get the region from your config.

$REGION = (Select-String -Path "$env:userprofile\.aws\config" -Pattern "(?<=\=\s).*").Matches.Value
 
