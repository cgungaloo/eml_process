$CSV_PATH = "powershell/upload_users_group.csv"

$EmployeeData = Import-Csv -Path $CSV_PATH -Delimiter ','


# foreach($Employee in $EmployeeData){
#     Write-Host "$($Employee.Username) has email $($Employee.Email) and belongs to group $($Employee.GroupName)"
# }
# {$departmentsToFilter -contains $_.emailID}
# $results= $EmployeeData | Where-Object {$_.Email -eq "idris.elba@bank.com"}
$results= $EmployeeData | Where-Object {$_.Email -like "idris*"}

$results 