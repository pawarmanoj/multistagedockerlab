#FROM mcr.microsoft.com/dotnet/sdk:7.0
FROM mcr.microsoft.com/dotnet/sdk:7.0 As build
RUN dotnet new console -o MyApp -f net7.0
WORKDIR /MyApp
#CMD dotnet run
RUN dotnet run

FROM mcr.microsoft.com/dotnet/aspnet:7.0
COPY --from=build /MyApp/bin/Debug/net7.0 ./
ENTRYPOINT ["dotnet", "MyApp.dll"]
