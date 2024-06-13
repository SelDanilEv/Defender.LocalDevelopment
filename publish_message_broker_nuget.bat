set /p API_KEY=<secrets/NugetApiKey
dotnet nuget push Code/Defender.Mongo.MessageBroker/src/Defender.Mongo.MessageBroker/bin/Debug/^
Defender.Mongo.MessageBroker.8.1.1.nupkg ^
--api-key %API_KEY% ^
--source https://api.nuget.org/v3/index.json
pause



