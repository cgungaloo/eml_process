
$Name = "test_group"

# Get-Command Get-JCGroup -Module JumpCloud

Get-JCGroup -type User -Name "test_group"

Get-JCGroup  -type User  | Get-JCUsergroupmember | Group-Object GroupName

$users = Import-Csv -Path "powershell/upload_users.csv"

foreach ($user in $users) {
    $email = $user.Email
    $first_name = $user.Firstname
    $last_name = $user.Lastname
    $group_name = $user.GroupName
    $user_name = $user.Username

    New-JCUser -firstname $first_name -lastname $last_name -username $user_name -email $email

}

# Import-CSV "powershell/upload_users.csv" | Add-JCUserGroupMember
