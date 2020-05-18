# Gauge CSharp Core

[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v1.4%20adopted-ff69b4.svg)](CODE_OF_CONDUCT.md)

`Core` is a dll that brings in Gauge's protobuf communication code. It is hosted in [Nuget](https://www.nuget.org/packages/Gauge.CSharp.Core/).

You will need Gauge and Gauge-csharp plugin installed before installing `Core`.

## Build

This project uses [`paket`](https://fsprojects.github.io/Paket/) for dependency management. `paket` is installed as `dotnet tool`. 

* `dotnet tool restore` - install `paket` as dotnet tool
* `dotnet paket restore` - restore dependencies for the project.

From the root of this repository, run (`build.sh` on MONO `build.cmd` on Windows)
 * `./build.sh build`
 * `.build.sh package`, creates the `nuget` package;

To generate `proto` messages

* run `./gen-proto.ps1` in `powershell` (Windows)
* run `./genproto.sh` (Unix based systems)

## License

This program is licensed under:

[Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)

## About
`Core` holds the definition for connecting to Gauge and exchange messages via ProtoBuf over tcp connection. It is used by `Lib` and the `Runner`.

## Sponsors

This project is sponsored by [Thoughtworks Inc.](http://www.thoughtworks.com/).
