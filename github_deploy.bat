@echo off
setlocal

set SERVICE_DIR=%~1

@REM Do not pull flag
if "%SERVICE_DIR%"=="dnp" (
    echo No SERVICE_DIR provided, skipping git pull.
) else (
    echo DIR: '%SERVICE_DIR%'
    cd C:\Danil\MyApps\Apps\%SERVICE_DIR%
    git pull origin main
)

set SERVICE_NAME=%~2

cd C:\Danil\MyApps\
docker-compose -f dev-core-docker-compose.yml -p dev up -d --build %SERVICE_NAME%

endlocal