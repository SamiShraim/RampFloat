param($Paths)
$include= "$Paths/mps170/apps/version.h"

$tag_name = (git tag -l | Select-String -Pattern 'mps179'| Select-String -Pattern 'display' -NotMatch | Sort-Object -Descending | Select-Object -First 1).Line

Write-Output $tag_name

Write-Host "the latest tag is $gitTags"
Write-Host "the Current path is $Paths"

cat $include




