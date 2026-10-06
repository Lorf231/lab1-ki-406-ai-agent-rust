@echo off
setlocal

cargo build --release
if errorlevel 1 exit /b 1

cargo test
if errorlevel 1 exit /b 1

if not exist target\release\hello.exe exit /b 1
exit /b 0
