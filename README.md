# VanillaPlus Northstar

A version of the [Northstar modding framework](https://northstar.tf/) for Titanfall 2,
with vanilla compatabilty enabled by default.

This uses [a fork of NorthstarLauncher](https://github.com/Klemmbaustein/NorthstarLauncher/tree/vanillacompat)
which has vanilla compatabilty enabled by default.
Vanilla compatability can be turned off by launching the game with `-noVanilla`

## Installation

To install VanillaPlus Northstar, just copy all files from the release into your Titanfall 2 game directory.

## Building

To create a release, run `repos/Combine-Build.ps1`. This will place a release in `repos/out/`.

### Build script arguments:

| Argument             | Effect                                             |
|----------------------|----------------------------------------------------|
| `-msvc`              | Build the launcher with `cl` instead of `clang-cl` |
| `-includeDebugFiles` | Includes debug files (.pdb) in the release         |
| `-version`           | The version string of the build (Example: 1.2.3)   |
