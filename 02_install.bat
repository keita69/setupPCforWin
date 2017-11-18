@echo off

REM ===========================================================================
REM   AUTO SETUP BAT FOR YOUR PC 
REM   [WARN] Please execute this bat file with administrator privilege !!
REM ===========================================================================

REM ///////////////////////////////////////////////////////////////////////////
REM   init
REM ///////////////////////////////////////////////////////////////////////////
title install
setlocal enabledelayedexpansion
cd /d %~dp0

for /f "tokens=1,* delims==" %%a in (00_setting.ini) do (
    set %%a=%%b
)

REM ///////////////////////////////////////////////////////////////////////////
REM   install software 
REM ///////////////////////////////////////////////////////////////////////////

echo install chocolatey 
REM check that chocolatey is installed
choco -v
if %errorlevel% neq 0 (
  @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
)

REM foreachループ処理
set i=1
:BEGIN
call set app=%%CHOCO_APP_!i!%%
if defined app (
  echo ######################################## 
  echo ### chocolatey install -y !app!
  echo ######################################## 
  choco install -y !app!
  set /A i+=1
  goto :BEGIN
)

echo.
echo ######################################## 
echo ### Chocolatey Installed Package List
echo ### Please delete or upgrade 
echo ###    - delete  : choco uninstall %app_name%
echo ###    - upgrade : choco upgrade %app_name%
echo ######################################## 
choco list -l
echo.
echo.
