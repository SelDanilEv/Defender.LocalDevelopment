@echo off
docker-compose -f dev-docker-compose.yml -p dev %* up -d --build