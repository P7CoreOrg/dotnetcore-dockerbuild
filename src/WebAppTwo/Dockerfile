FROM mcr.microsoft.com/dotnet/core/aspnet:3.0-buster-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM dotnetcore/dotnet-dockerbuild AS build
WORKDIR /src
RUN dotnet publish WebAppTwo -c Release -o out --no-restore --no-build

FROM base AS final
WORKDIR /app
COPY --from=build /src/out .
ENTRYPOINT ["dotnet", "WebAppTwo.dll"]