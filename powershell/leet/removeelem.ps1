
Function removelem {
    param(
        [int] $num,
        [System.Collections.ArrayList] $nums
    )

    while ($nums -contains $num) {
        $nums.Remove($num)
    }
}

[System.Collections.ArrayList]$caps = 1,2,3,2,5,2,6,7,8,9,9
$num = 2

removelem -num $num -nums $caps

$caps