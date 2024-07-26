$Name="cg_ad_group"
$Description="test ad group for automation"
New-ADGroup -Name $Name -GroupScope Global -GroupCategory Security -Path $OU -Description $Description
