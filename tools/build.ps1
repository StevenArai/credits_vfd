param([string]$BuildDir = 'build/host', [string]$BuildType = 'Release', [switch]$Sanitize)
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$compilerBin = (Join-Path $root '.tools/llvm-mingw-20260922-ucrt-x86_64/bin').Replace('\', '/')
$cmake = 'C:/Users/Steve/.espressif/tools/cmake/3.24.0/bin/cmake.exe'
$ninja = 'C:/Users/Steve/.espressif/tools/ninja/1.11.1/ninja.exe'
$env:PATH = "$compilerBin;" + $env:PATH
$sanitizeOption = if ($Sanitize) { 'ON' } else { 'OFF' }
& $cmake -S $root -B (Join-Path $root $BuildDir) -G Ninja "-DCMAKE_MAKE_PROGRAM=$ninja" "-DCMAKE_C_COMPILER=$compilerBin/clang.exe" "-DCMAKE_BUILD_TYPE=$BuildType" "-DCREDITS_SANITIZE=$sanitizeOption"
if ($LASTEXITCODE) { exit $LASTEXITCODE }
& $cmake --build (Join-Path $root $BuildDir)
if ($LASTEXITCODE) { exit $LASTEXITCODE }
if ($Sanitize) {
    $env:ASAN_OPTIONS = 'halt_on_error=1:detect_leaks=0'
    $env:UBSAN_OPTIONS = 'halt_on_error=1:print_stacktrace=1'
}
& (Join-Path (Split-Path $cmake) 'ctest.exe') --test-dir (Join-Path $root $BuildDir) --output-on-failure
exit $LASTEXITCODE
