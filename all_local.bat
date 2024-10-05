@echo off
docker-compose -f local-docker-compose.yml -p local %* up -d --build