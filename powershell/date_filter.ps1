$FilePath = "powershell/date_data.csv"

$Data = Import-Csv $FilePath -Delimiter ','

$new_date = (Get-date).AddYears(-20).ToString('yyyy-MM-dd')
$Data | Where-Object birthday -ge $($new_date)
"-----"
$Data | Where-Object birthday -ge '2000-01-01' | where birthday -le '2010-01-01'