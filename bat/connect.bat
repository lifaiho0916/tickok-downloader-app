@echo off
echo "Running adb connect"
adb tcpip 55555
adb connect 192.168.1.3:55555