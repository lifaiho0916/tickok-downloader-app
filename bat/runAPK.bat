@echo off
cls&&connect&&cls&&cd..&&flutter run --use-application-binary=build/app/outputs/apk/debug/app-debug.apk&&bat
::if exist "\build\app\outputs\apk\debug\app-debug.apk" (
::flutter run --use-application-binary=build/app/outputs/apk/debug/app-debug.apk&&bat
::) else (
::bat&&run
::)