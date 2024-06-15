@echo off
set BUILD_COMMAND=

if "%~1"=="--build" (
    set BUILD_COMMAND=--build
)

docker-compose -f dev-docker-compose.yml -p dev up %BUILD_COMMAND%