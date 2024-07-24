Function add_to_ad_group{

    param(
        [string]$csvFile1Path,
        [string]$csvFile2Path,
        [string]$outFile
    )

    if ((Test-Path $outFile)){
        Remove-Item $outFile
    }

    $csvFile1 = Import-Csv -Path $csvFile1Path
    $csvFile2 = Import-Csv -Path $csvFile2Path

    $combinedCsv = $csvFile1 + $csvFile2

    $combinedCsv | Export-Csv $outFile -Delimiter ','
}

Function remove_from_ad_group{

    param(
        [string]$items_to_remove_f,
        [string]$ad_group_og,
        [string]$outFile
    )
    $items_to_remove
    if ((Test-Path $outFile)){
        Remove-Item $outFile
    }

    $items_to_remove = Import-Csv "powershell/ad_to_add.csv" -Delimiter ','
    $ad_group = Import-Csv $ad_group_og -Delimiter ','
    "-------"
    $items_to_remove
    "-------"
    $ad_group
    $keyColumn = "EmailID"
    "-------"
    $csvFile2Keys = $items_to_remove | ForEach-Object { $_.$keyColumn } | Out-String
    $csvFile2Keys
    "-----"
    $target_cols = Import-Csv $ad_group_og| Select-Object -Expand $keyColumn
    $target_cols
    "-----"
    $filtered_csv = $items_to_remove | Where-Object {
        $ad_group -notcontains $_.$keyColumn
    } | Export-Csv $outFile -Delimiter ','

    $filtered_csv
}

# add_to_ad_group -csvFile1Path "powershell/ad_to_add.csv" -csvFile2Path "powershell/ad_group_og.csv" -outFile "powershell/ad_group_new.csv"

remove_from_ad_group -items_to_remove_f 'powershell/ad_to_add.csv' -ad_group_og 'powershell/ad_group_full.csv' -outFile 'powershell/ad_group_new.csv'