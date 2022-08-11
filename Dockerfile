FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR C:/Users/Administrator/code/dotnetcode/ConsoleApp

# Copy everything
COPY . ./
# Restore as distinct layers
RUN echo %cd%
# RUN cd ConsoleApp
RUN dotnet restore ConsoleApp.csproj
# Build and publish a release
# RUN dotnet publish -c Release -o out
RUN dotnet publish C:/Users/Administrator/AppData/Local/Jenkins/.jenkins/workspace/sample/ConsoleApp/ConsoleApp.sln
# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "ConsoleApp.dll"]
ENTRYPOINT ["dotnet", "UnitTestProject.dll"]
