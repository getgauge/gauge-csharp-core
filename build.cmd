@echo off
set tasks=build package
for %%a in (%tasks%) do (
    if %1==%%a goto %1
)

echo Options: "[build | package]"
goto :eof

:build
    dotnet tool restore
    dotnet build -c release
    goto :eof

:package
    rmdir /s /q artifacts
    dotnet tool restore
    dotnet pack -c release -o ./artifacts Gauge.CSharp.Core
    goto :eof

