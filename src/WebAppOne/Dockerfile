FROM mcr.microsoft.com/dotnet/core/aspnet:3.0-buster-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:3.0-buster AS build
WORKDIR /src
COPY . ./
RUN dotnet publish WebAppOne -c Release -o out

FROM base AS final
WORKDIR /app
COPY --from=build /src/out .
ENTRYPOINT ["dotnet", "WebAppOne.dll"]