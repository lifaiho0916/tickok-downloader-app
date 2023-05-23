@echo off
::a
::wmic process where name="msedge.exe" call setpriority "idle"
::wmic process where name="msedge.exe" call setpriority "normal"
wmic process where name="dart.exe" call setpriority "idle"
wmic process where name="java.exe" call setpriority "idle"
wmic process where name="code.exe" call setpriority "idle"
::goto a