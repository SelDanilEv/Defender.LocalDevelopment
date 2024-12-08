set /p API_KEY=<secrets/NugetApiKey
dotnet nuget push Apps/Defender.DistributedCache/src/Defender.DistributedCache/bin/Debug/^
Defender.DistributedCache.0.1.2.nupkg ^
--api-key %API_KEY% ^
--source https://api.nuget.org/v3/index.json
pause



