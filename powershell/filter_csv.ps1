$csv = Import-Csv "powershell/ad_group_full.csv"

$departmentsToFilter = @("idris.elba@bank.com", "tom.hanks@bank.com")
# $csv_filter = $csv | Where-Object { $_.emailID -eq $departmentsToFilter}

$csv_filter = $csv | Where-Object {$departmentsToFilter -contains $_.emailID}
$csv_filter