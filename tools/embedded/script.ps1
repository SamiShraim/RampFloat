param($Paths)
$include= "$Paths/mps170/apps/version.h"

$tag_name = (git tag -l | Select-String -Pattern 'mps179'| Select-String -Pattern 'display' -NotMatch | Sort-Object -Descending | Select-Object -First 1).Line

Write-Output $tag_name

$current_tag_name = (git describe --tags --abbrev=0 | Select-String -Pattern 'mps179'| Select-String -Pattern 'display' -NotMatch).Line
Write-Output $current_tag_name

Write-Host "the latest tag is $tag_name"
Write-Host "the Current commit tag is $current_tag_name"
Write-Host "the Current path is $Paths"

$A = ($tag_name -split '-')[1]
$B = ($current_tag_name -split '-')[1]

if ($currentCommitTag -eq $tag_name) {
    $RELEASE_VERSION = $A
} else {
    $RELEASE_VERSION = $B
    $lines = Get-Content -Path $include
    $lines[5] = "#define version_dirty 0x01"
    $lines | Set-Content -Path $include
}

$major, $minor, $patch = $RELEASE_VERSION -split '.'

$major = "{0:X}" -f $major
$minor = "{0:X}" -f $minor
$patch = "{0:X}" -f $patch

(Get-Content -Path $include) | ForEach-Object {
    $_ -replace "#define version_major.*","#define version_major 0x$major"
    $_ -replace "#define version_minor.*","#define version_minor 0x$minor"
    $_ -replace "#define version_patch.*","#define version_patch 0x$patch"
} | Set-Content -Path $include

cat $include
