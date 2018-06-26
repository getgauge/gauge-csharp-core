# Gauge CSharp Core

`Core` is a dll that brings in Gauge's protobuf communication code. It is hosted in [Nuget](https://www.nuget.org/packages/Gauge.CSharp.Core/).

You will need Gauge and Gauge-csharp plugin installed before installing `Core`.

## Build

From the root of this repository, run (`build.sh` on MONO `build.cmd` on Windows)
 * `./build.sh build`
 * `.build.sh package`, creates the `nuget` package;

To generate `proto` messages

* run `./gen-proto.ps1` in `powershell`

TODO: Add proto generation support for Unix.

## License
This project is released under [GPLv3](http://www.gnu.org/licenses/gpl-3.0.txt). 

## About
`Core` holds the definition for connecting to Gauge and exchange messages via ProtoBuf over tcp connection. It is used by `Lib` and the `Runner`.

## Sponsors

This project is sponsored by [Thoughtworks Inc.](http://www.thoughtworks.com/).
