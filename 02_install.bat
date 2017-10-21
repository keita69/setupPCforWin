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

for /f "tokens=1,* delims==" %%a in (setting.ini) do (
    set %%a=%%b
)

REM ///////////////////////////////////////////////////////////////////////////
REM   install software 
REM ///////////////////////////////////////////////////////////////////////////

echo install chocolatey 
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

echo install docker-tool box with git-bash
choco install -y docker-toolbox

echo install VisualStudioCode
choco install -y VisualStudioCode

echo install clibor (clibor is a tool to record and save clipbord data)
choco install -y clibor

echo install golang
choco install -y golang

REM ///////////////////////////////////////////////////////////////////////////
REM   pause
REM ///////////////////////////////////////////////////////////////////////////
pause
