param($Paths)
$include= "$Paths/mps170/apps/version.h"

$gitTags = git tag -l
$tag_name = ($gitTags | Select-String -Pattern 'mps179' -NotMatch 'display' | Sort-Object -Property Version | Select-Object -Last 1).Line
Write-Output $tag_name

Write-Host "the latest tag is $gitTags"
Write-Host "the Current path is $Paths"






cat $include