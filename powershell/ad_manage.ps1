
$Name = "test_group"

# Get-Command Get-JCGroup -Module JumpCloud

Get-JCGroup -type User -Name "test_group"

Get-JCGroup  -type User  | Get-JCUsergroupmember | Group-Object GroupName

