set /p API_KEY=<secrets/NugetApiKey

dotnet nuget push Apps/Defender.Common/src/Defender.Common/bin/Debug/^
Defender.Common.1.6.1.nupkg ^
--api-key %API_KEY%  ^
--source https://api.nuget.org/v3/index.json

dotnet nuget push Apps/Defender.Kafka/src/Defender.Kafka/bin/Debug/^
Defender.Kafka.8.0.0.nupkg ^
--api-key %API_KEY%  ^
--source https://api.nuget.org/v3/index.json

dotnet nuget push Apps/Defender.DistributedCache/src/Defender.DistributedCache/bin/Debug/^
Defender.DistributedCache.0.1.4.nupkg ^
--api-key %API_KEY% ^
--source https://api.nuget.org/v3/index.json

dotnet nuget push Apps/Defender.Mongo.MessageBroker/src/Defender.Mongo.MessageBroker/bin/Debug/^
Defender.Mongo.MessageBroker.8.1.5.nupkg ^
--api-key %API_KEY% ^
--source https://api.nuget.org/v3/index.json

pause
