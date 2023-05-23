@echo off
cd ../android&&gradlew --stop && gradlew clean build&&cd ..&&flutter clean&&flutter pub get&&bat