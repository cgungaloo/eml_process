# Load list of users from csv
$users = Import-CSV "powershell/remove_users.csv"
$usernames = $users.Username

# get list of current users from AD group
$current_users = Get-JCAssociation -Type user_group -Name "test_group" -IncludeNames | Select-Object "targetName"
# Put usernames into list
$current_usernames = foreach ($current_user in $current_users)
{
    $current_user.targetName
}

# Get difference between users in group and in csv
$diffs = Compare-Object -ReferenceObject ($usernames | Sort-Object) -DifferenceObject ($current_usernames | Sort-Object)

# Remove users in CSV but not in AD group
foreach ($diff in $diffs){
    Remove-JCUserGroupMember -GroupName "test_group" -Username $diff.InputObject
}
