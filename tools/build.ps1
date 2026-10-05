param([string]$BuildDir = 'build/host', [string]$BuildType = 'Release')
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$compilerBin = (Join-Path $root '.tools/llvm-mingw-20260922-ucrt-x86_64/bin').Replace('\', '/')
$cmake = 'C:/Users/Steve/.espressif/tools/cmake/3.24.0/bin/cmake.exe'
$ninja = 'C:/Users/Steve/.espressif/tools/ninja/1.11.1/ninja.exe'
$env:PATH = "$compilerBin;" + $env:PATH
& $cmake -S $root -B (Join-Path $root $BuildDir) -G Ninja "-DCMAKE_MAKE_PROGRAM=$ninja" "-DCMAKE_C_COMPILER=$compilerBin/clang.exe" "-DCMAKE_BUILD_TYPE=$BuildType"
if ($LASTEXITCODE) { exit $LASTEXITCODE }
& $cmake --build (Join-Path $root $BuildDir)
if ($LASTEXITCODE) { exit $LASTEXITCODE }
& (Join-Path (Split-Path $cmake) 'ctest.exe') --test-dir (Join-Path $root $BuildDir) --output-on-failure
exit $LASTEXITCODE
