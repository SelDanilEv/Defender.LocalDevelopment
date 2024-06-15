@echo off
set BUILD_COMMAND=

if "%~1"=="--build" (
    set BUILD_COMMAND=--build
)

docker-compose -f local-docker-compose.yml -p local up %BUILD_COMMAND%