@echo off

REM ===========================================================================
REM   AUTO SETUP BAT FOR YOUR PC 
REM   [WARN] Please execute this bat file with administrator privilege !!
REM ===========================================================================

REM ///////////////////////////////////////////////////////////////////////////
REM   init
REM ///////////////////////////////////////////////////////////////////////////
title Config
setlocal enabledelayedexpansion
cd /d %~dp0

for /f "tokens=1,* delims==" %%a in (00_setting.ini) do (
    set %%a=%%b
)

echo ///////////////////////////////////////////////////////////////////////////
echo   install software config 
echo ///////////////////////////////////////////////////////////////////////////

echo ## git config 
git config --global user.email "%GIT_USER_EMAIL%"
git config --global user.name "%GIT_USER_NAME%"
git config --global core.autoCRLF false

echo ## ~/.bashrc

echo ## Visual Studio Code Extension
echo golang
call code.cmd --install-extension lukehoban.go
