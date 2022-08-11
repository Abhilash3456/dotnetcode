#FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
#WORKDIR /ConsoleApp
#COPY *.sln /dotnetfile/task/solution.sln
#COPY ConsoleApp/*.csproj ./ConsoleApp/
# Restore as distinct layers
#RUN echo %cd%
# RUN cd ConsoleApp
#RUN dotnet restore
# Build and publish a release
# RUN dotnet publish -c Release -o out
#RUN dotnet publish C:/Users/Administrator/AppData/Local/Jenkins/.jenkins/workspace/sample/ConsoleApp/ConsoleApp.sln
# Build runtime image
#FROM mcr.microsoft.com/dotnet/aspnet:6.0
#WORKDIR /app
#COPY --from=build-env /app/out .
#ENTRYPOINT ["dotnet", "ConsoleApp.dll"]
#ENTRYPOINT ["dotnet", "UnitTestProject.dll"]
#FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime
#WORKDIR /app
#COPY published/ ./
#ENTRYPOINT ["dotnet", "aspnetapp.dll"]
#RUN dotnet restore C:/Users/Administrator/AppData/Local/Jenkins/.jenkins/workspace/sample/ConsoleApp/ConsoleApp.sln
#RUN dotnet build --configuration Release C:/Users/Administrator/AppData/Local/Jenkins/.jenkins/workspace/sample/ConsoleApp/ConsoleApp.sln
#RUN dotnet publish C:/Users/Administrator/AppData/Local/Jenkins/.jenkins/workspace/sample/ConsoleApp/ConsoleApp.sln
# Stage 1
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /build
COPY . .
RUN dotnet restore
RUN dotnet publish -c Release -o /app
# Stage 2
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS final
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "ConsoleApp.dll"]
