# This script creates a new build and places it in the repos/out directory.

param (
	# False if clang-cl should be used to compile NorthstarLauncher, true for MSVC cl
	[switch] $msvc = $false,
	# Will include .pdb files when building NorthstarLauncher
	[switch] $includeDebugFiles = $false,
	# The built version
	[string] $version = "DEV"
)

$root = $PSScriptRoot
$outDir = "$root/out/"
$profileName = "R2VanillaPlus"

mkdir $outDir -force

Copy-Item "$root/../LICENSE.txt" "$outDir/"

# Build NorthstarLauncher

if ($msvc)
{
	$env:cc = "cl"
}
else
{
	$env:cc = "clang-cl"
}

$env:cxx = $env:cc

Write-Host "Using C/C++ compiler: $env:cc"

cd "$root/NorthstarLauncher"

cmake -S . -B build/ -DCMAKE_BUILD_TYPE=Release -G "Ninja" -DNORTHSTAR_IS_VANILLAPLUS=ON

function Replace-FileString
{
	param (
		[string] $fileName,
		[string] $from,
		[string] $to
	)

	(Get-Content $fileName).Replace($from, $to) | Set-Content $fileName
}

if ($version -ne "DEV")
{
	# Repalce the version string in each .rc file from DEV to the version string.
	$resourceFiles = "$root/NorthstarLauncher/primedev/resources.rc", "$root/NorthstarLauncher/primedev/primelauncher/resources.rc"
	foreach ($file in $resourceFiles)
	{
		Replace-FileString -fileName $file -from "DEV" -to $version
	}

	# Replace the version string in the version header.
	# I don't know why this has to be separate from the resource files,
	# since you can just read entries from the resource file with the windows api.
	Replace-FileString -filename "$root/NorthstarLauncher/primedev/ns_version.h" -from "0,0,0,1" -to ($version.Replace(".", ",") + ",0")
}

cmake --build build/

Copy-Item -recurse -force build/game/* $outDir

if (!$includeDebugFiles)
{
	rm "$outDir/*.pdb"
}
# Copy mods

cd $root

mkdir "$outDir/$profileName/mods/" -force
Copy-Item "NP.VanillaPlus/mods/*" "$outDir/$profileName/mods/" -recurse -force

