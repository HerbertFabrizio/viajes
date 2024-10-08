FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env
WORKDIR /app

COPY *.csproj ./
RUN dotnet restore

FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build-env /app/out .

ENV APP_NET_CORE viajes.dll
CMD ASPNETCORE_URLS=http://*:$PORT dotnet $APP_NET_CORE