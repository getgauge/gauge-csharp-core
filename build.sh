#!/bin/bash

function checkCommand() {
    command -v $1 >/dev/null 2>&1 || { echo >&2 "$1 is not installed, aborting."; exit 1; }
}

function build() {
    checkCommand "dotnet"
    dotnet tool restore
    dotnet build -c release
}

function package() {
    checkCommand "dotnet"
    dotnet tool restore
    rm -rf deploy artifacts
    dotnet pack -c release -o ./artifacts Gauge.CSharp.Core
}

tasks=(build test package)
if [[ " ${tasks[@]} " =~ " $1 " ]]; then
    $1
    exit 0
fi

echo Options: [build \| package]
