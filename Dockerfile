# ============================================
# BUILD STAGE
# ============================================
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR /src

COPY . .

RUN dotnet restore src/HelloDotnetApp/HelloDotnetApp.csproj

RUN dotnet publish src/HelloDotnetApp/HelloDotnetApp.csproj \
-c Release \
-o /app/publish

# ============================================
# RUNTIME STAGE
# ============================================
FROM mcr.microsoft.com/dotnet/aspnet:8.0

WORKDIR /app

COPY --from=build /app/publish .

EXPOSE 80

ENTRYPOINT ["dotnet", "HelloDotnetApp.dll"]