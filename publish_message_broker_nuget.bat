set /p API_KEY=<secrets/NugetApiKey
dotnet nuget push Apps/Defender.Mongo.MessageBroker/src/Defender.Mongo.MessageBroker/bin/Debug/^
Defender.Mongo.MessageBroker.8.1.2.nupkg ^
--api-key %API_KEY% ^
--source https://api.nuget.org/v3/index.json
pause



