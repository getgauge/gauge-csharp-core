# Copyright 2015 ThoughtWorks, Inc.

# This file is part of Gauge-CSharp.

# Gauge-CSharp is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# Gauge-CSharp is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with Gauge-CSharp.  If not, see <http://www.gnu.org/licenses/>.
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
