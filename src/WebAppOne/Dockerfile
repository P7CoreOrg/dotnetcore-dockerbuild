FROM mcr.microsoft.com/dotnet/core/aspnet:2.2-stretch-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM dotnetcore/dotnet-dockerbuild AS build
WORKDIR /src
RUN dotnet publish WebAppOne -c Release -o out --no-restore --no-build

FROM base AS final
WORKDIR /app
COPY --from=build /src/WebAppOne/out .
ENTRYPOINT ["dotnet", "WebAppOne.dll"]
