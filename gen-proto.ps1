# ----------------------------------------------------------------
#   Copyright (c) ThoughtWorks, Inc.
#   Licensed under the Apache License, Version 2.0
#   See LICENSE.txt in the project root for license information.
# ----------------------------------------------------------------

.paket\paket.exe install

$protoc
$grpc_csharp

if ($env:PROCESSOR_ARCHITECTURE -match 64){
    $protoc = Resolve-Path .\packages\build\Grpc.Tools\tools\windows_x64\protoc.exe
    $grpc_csharp = Resolve-Path .\packages\build\Grpc.Tools\tools\windows_x64\grpc_csharp_plugin.exe
}
else {
    $protoc = Resolve-Path .\packages\build\Grpc.Tools\tools\windows_x86\protoc.exe
    $grpc_csharp = Resolve-Path .\packages\build\Grpc.Tools\tools\windows_x86\grpc_csharp_plugin.exe
}

Write-Host "Generating Proto Classes.."


gci ".\gauge-proto" -Filter "*.proto" | %{
    Write-Host "Generating classes for $_"
    &$protoc @('-I.\gauge-proto', '--csharp_out=.\Gauge.CSharp.Core','--grpc_out=.\Gauge.CSharp.Core',"--plugin=protoc-gen-grpc=$grpc_csharp", ".\gauge-proto\$_")
}

Write-Host "Done!"
