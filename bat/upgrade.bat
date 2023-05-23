@echo off
cd..&&flutter upgrade --force --verbose&&flutter update-packages --force-upgrade&&flutter pub upgrade --major-versions&&bat