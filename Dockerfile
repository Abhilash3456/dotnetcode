FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
COPY C:/Users/Administrator/AppData/Local/Jenkins/.jenkins/workspace/sample/ConsoleApp/UnitTestProject/bin/Debug/netcoreapp3.1/publish/ dotnetcode/
