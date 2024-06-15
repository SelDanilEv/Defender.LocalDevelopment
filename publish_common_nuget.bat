set /p API_KEY=<secrets/NugetApiKey
dotnet nuget push Apps/Defender.Common/src/Defender.Common/bin/Debug/^
Defender.Common.1.2.23.nupkg ^
--api-key %API_KEY%  ^
--source https://api.nuget.org/v3/index.json
pause
