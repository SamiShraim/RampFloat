param($latestTag, $currentCommitTag, $Paths)

Write-Host "the latest tag is $latestTag"
Write-Host "the Current commit tag is $currentCommitTag"
Write-Host "the Current path is $Paths"

$A = ($latestTag -split '-')[1]
$B = ($currentCommitTag -split '-')[1]

if ($currentCommitTag -eq $latestTag) {
    $RELEASE_VERSION = $A
} else {
    $RELEASE_VERSION = $B
    Add-Content -Path "$Paths/version.h" -Value "#define version_dirty 0x01"
}

$major, $minor, $patch = $RELEASE_VERSION -split '.'

$major = "{0:X}" -f $major
$minor = "{0:X}" -f $minor
$patch = "{0:X}" -f $patch

(Get-Content -Path "$Paths/version.h") | ForEach-Object {
    $_ -replace "#define version_major.*","#define version_major 0x$major"
    $_ -replace "#define version_minor.*","#define version_minor 0x$minor"
    $_ -replace "#define version_patch.*","#define version_patch 0x$patch"
} | Set-Content -Path "$Paths/version.h"

cat '$Paths/version.h'