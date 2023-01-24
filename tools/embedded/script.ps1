param($Paths)
$gitTags = git tag -l

Write-Host "the latest tag is $gitTags"
Write-Host "the Current path is $Paths"

cat '/mps170/apps/version.h'