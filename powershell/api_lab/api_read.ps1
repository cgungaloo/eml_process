# $headers=@{}
# $headers.Add("x-rapidapi-key", "83efc2ce89msh51729e312f5cf26p138710jsn6b4194f97038")
# $headers.Add("x-rapidapi-host", "yahoo-finance15.p.rapidapi.com")
# $response = Invoke-WebRequest -Uri 'https://yahoo-finance15.p.rapidapi.com/api/v1/markets/options/most-active?type=STOCKS' -Method GET -Headers $headers
# $response

Function generate_header{
    $headers=@{}
    $headers.Add("x-rapidapi-key", "your_api_key")
    $headers.Add("x-rapidapi-host", "yahoo-finance15.p.rapidapi.com")
    $headers
}

Function request_stock{
    param(
        [string]$base_url,
        [string]$endpoint,
        [string]$ticker,
        [string]$type
    )
    $uri = "$base_url$endpoint"+ "?ticker=$ticker&type=$type"
    $headers = generate_header
    $response = Invoke-WebRequest -Uri $uri -Method GET -Headers $headers
    $json_response = $response.Content | ConvertFrom-Json
    $json_response.body

}

Function create_row{

    param(
        [System.Object]$stock_data,
        [System.Collections.ArrayList]$all_data
    )
    $data = @{
        symbol =$stock_data.symbol
        askPrice = $stock_data.primaryData.askPrice
        askSize = $stock_data.primaryData.askSize
        bidPrice = $stock_data.primaryData.bidPrice
        lastSalePrice = $stock_data.primaryData.lastSalePrice
        percentageChange = $stock_data.primaryData.percentageChange
        stockType = $stock_data.stockType
    }
    $all_data.Add($data) > $null
}

$stockSummary = [System.Collections.ArrayList]::new()
$stockSummary.GetType().FullName
$base_url = 'https://yahoo-finance15.p.rapidapi.com/api/v1/'
$endpoint = 'markets/quote'
$type = 'STOCKS'

$val =request_stock -base_url $base_url -endpoint $endpoint -ticker 'AAPL' -type $type
create_row -stock_data $val -all_data $stockSummary
# $stockSummary1.GetType().FullName

$val =request_stock -base_url $base_url -endpoint $endpoint -ticker 'TSLA' -type $type
create_row -stock_data $val -all_data $stockSummary

$stockSummary | Export-Csv -Path 'output.csv' -NoTypeInformation