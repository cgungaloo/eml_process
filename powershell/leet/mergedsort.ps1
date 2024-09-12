Function merge{
        param(
            [System.Collections.ArrayList]$a1,
            [System.Collections.ArrayList]$a2
            )

            $a3 = $a1 + $a2 | Sort-Object

            return $a3
        }
        


$a1 = 1,3,5,7,9
$a2 = 2,4,6,8,10

$res = merge -a1 $a1 -a2 $a2

$res