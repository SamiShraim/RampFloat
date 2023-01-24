param($Paths)
$include= "$Paths/mps170/apps/version.h"

$gitTags = 'mps179-display-1.2.3', 'mps179-display-1.3.3', 'mps179-1.2.3', 'mps179-2.2.3'
$tag_name = 'mps179-display-1.3.3', 'mps179-1.2.3', | Select-String -Pattern 'mps179' -NotMatch 'display' | Sort-Object -Property Version | Select-Object -Last 1
Write-Output $tag_name

$tag_name = ($gitTags | Select-String -Pattern 'mps179' -NotMatch 'display' | Sort-Object -Property Version | Select-Object -Last 1).Line

Write-Output $tag_name

Write-Host "the latest tag is $gitTags"
Write-Host "the Current path is $Paths"

cat $include