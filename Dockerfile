FROM mcr.microsoft.com/dotnet/aspnet:5.0
COPY C:/Users/Administrator/AppData/Local/Jenkins/.jenkins/workspace/sample/ConsoleApp/UnitTestProject/bin/Debug/netcoreapp3.1/publish/ dotnetcode/
WORKDIR /dotnetcode
ENTRYPOINT ["dotnet", "ConsoleApp.dll"]
