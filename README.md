# VanillaPlus Northstar

A version of the [Northstar modding framework](https://northstar.tf/) for Titanfall 2,
with vanilla compatabilty enabled by default.

This uses [a fork of NorthstarLauncher](https://github.com/Klemmbaustein/NorthstarLauncher/tree/vanillacompat)
which has vanilla compatabilty enabled by default.
Vanilla compatability can be turned off by launching the game with `-noVanilla`.

## Installation

To install VanillaPlus Northstar, just copy all files from the release into your Titanfall 2 game directory.

VanillaPlus Northstar doesn't break any existing Northstar installation. After installing it,
Northstar can be launched normally, even through `Titanfall2.exe -northstar`.

## Launching

VanillaPlus Northstar can either be launched through `VanillaPlusLauncher.exe`, or by adding the `-vanillaPlus` argument to
`Titanfall2.exe`.

### All added launch arguments

| Argument             | Effect                                                                                                  |
|----------------------|---------------------------------------------------------------------------------------------------------|
| `-dllName`           | The .dll name the launcher is supposed to load. The .dll must be similar to Northstar for this to work. |
| `-noVanilla`         | Disables Northstar vanilla compatabilty mode.                                                           |

## Building

To create a release, run `repos/Combine-Build.ps1`. This will place a release in `repos/out/`.

CMake and clang-cl must be installed (or just cl if the script has the `-msvc` argument).

### Build script arguments:

| Argument             | Effect                                             |
|----------------------|----------------------------------------------------|
| `-msvc`              | Build the launcher with `cl` instead of `clang-cl` |
| `-includeDebugFiles` | Includes debug files (.pdb) in the release         |
| `-version`           | The version string of the build (Example: 1.2.3)   |
