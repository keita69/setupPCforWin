@echo off

REM ===========================================================================
REM   AUTO SETUP BAT FOR YOUR PC 
REM   [WARN] Please execute this bat file with administrator privilege !!
REM ===========================================================================

REM ///////////////////////////////////////////////////////////////////////////
REM   init
REM ///////////////////////////////////////////////////////////////////////////
title setup
cd /d %~dp0

@powershell -NoProfile -ExecutionPolicy unrestricted -Command "Start-Process 02_install.bat -Verb runas" -Wait
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "Start-Process 03_config.bat -Verb runas" -Wait
