REM Platform options: "x86", "x64", "x64"
REM /p:Configuration="Debug" or "Release"


REM retrieve new version number
REM See http://stackoverflow.com/questions/4044579/how-to-get-output-of-a-for-loop-into-a-variable-in-a-batch-file
cd "%CD%\..\RdlEngine"
for /f "tokens=2 delims=()" %%a in ('findstr AssemblyVersion AssemblyInfo.cs') do set Version=%%~a

set Version=%Version:.*=%
echo %Version%
cd ..
cd Release-Builds

nuget restore "../MajorsilenceReporting.sln"

REM ************* Begin x64 *********************************************

"C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe" "%CD%\..\MajorsilenceReporting-35.sln" /v:q /nologo /toolsversion:4.0 /p:Configuration="Release";Platform="x64";TargetFrameworkVersion=v3.5 /t:clean;rebuild /m:4

rmdir .\build-output\majorsilence-reporting-build-dot-net-2-x64 /s /q
mkdir .\build-output\majorsilence-reporting-build-dot-net-2-x64

copy ..\DataProviders\bin\Release\DataProviders.dll .\build-output\majorsilence-reporting-build-dot-net-2-x64\DataProviders.dll /Y
copy ..\RdlCmd\bin\x64\Release\RdlCmd.exe .\build-output\majorsilence-reporting-build-dot-net-2-x64\RdlCmd.exe /Y
copy ..\RdlCri\bin\Release\RdlCri.dll .\build-output\majorsilence-reporting-build-dot-net-2-x64\RdlCri.dll /Y
copy ..\RdlEngine\bin\Release\RdlEngine.dll .\build-output\majorsilence-reporting-build-dot-net-2-x64\RdlEngine.dll /Y
copy ..\RdlEngine\bin\Release\ICSharpCode.SharpZipLib.dll .\build-output\majorsilence-reporting-build-dot-net-2-x64\ICSharpCode.SharpZipLib.dll /Y
copy ..\RdlEngine\bin\Release\System.Data.SQLite.dll .\build-output\majorsilence-reporting-build-dot-net-2-x64\System.Data.SQLite.dll /Y
copy ..\RdlEngine\bin\Release\RdlEngineConfig.xml .\build-output\majorsilence-reporting-build-dot-net-2-x64\RdlEngineConfig.xml /Y
copy ..\RdlViewer\bin\Release\RdlViewer.dll .\build-output\majorsilence-reporting-build-dot-net-2-x64\RdlViewer.dll /Y
copy ..\RdlViewer\RdlReader\bin\x64\Release\RdlReader.exe .\build-output\majorsilence-reporting-build-dot-net-2-x64\RdlReader.exe /Y
copy ..\RdlAsp\bin\Release\RdlAsp.dll .\build-output\majorsilence-reporting-build-dot-net-2-x64\RdlAsp.dll /Y
copy ..\RdlMapFile\bin\x64\Release\RdlMapFile.exe .\build-output\majorsilence-reporting-build-dot-net-2-x64\RdlMapFile.exe /Y
copy ..\RdlDesktop\bin\x64\Release\RdlDesktop.exe .\build-output\majorsilence-reporting-build-dot-net-2-x64\RdlDesktop.exe /Y
copy ..\RdlDesktop\bin\x64\Release\config.xml .\build-output\majorsilence-reporting-build-dot-net-2-x64\config.xml /Y
copy ..\LibRdlWpfViewer\bin\Release\LibRdlWpfViewer.dll .\build-output\majorsilence-reporting-build-dot-net-2-x64\LibRdlWpfViewer.dll /Y

copy "..\packages\ZXing.Net.0.14.0.1\lib\net35\zxing.dll" .\build-output\majorsilence-reporting-build-dot-net-2-x64\zxing.dll
copy "..\packages\iTextSharp-LGPL.4.1.6\lib\iTextSharp.dll" .\build-output\majorsilence-reporting-build-dot-net-2-x64\iTextSharp.dll /Y

mkdir .\build-output\majorsilence-reporting-build-dot-net-2-x64\ru-RU
copy ..\RdlDesktop\bin\x64\Release\ru-RU\RdlDesktop.resources.dll .\build-output\majorsilence-reporting-build-dot-net-2-x64\ru-RU\RdlDesktop.resources.dll /Y
copy ..\RdlEngine\bin\Release\ru-RU\RdlEngine.resources.dll .\build-output\majorsilence-reporting-build-dot-net-2-x64\ru-RU\RdlEngine.resources.dll /Y
copy ..\RdlMapFile\bin\x64\Release\ru-RU\RdlMapFile.resources.dll .\build-output\majorsilence-reporting-build-dot-net-2-x64\ru-RU\RdlMapFile.resources.dll /Y
copy ..\RdlViewer\bin\Release\ru-RU\RdlViewer.resources.dll .\build-output\majorsilence-reporting-build-dot-net-2-x64\ru-RU\RdlViewer.resources.dll /Y
copy ..\RdlViewer\RdlReader\bin\x64\Release\ru-RU\RdlReader.resources.dll .\build-output\majorsilence-reporting-build-dot-net-2-x64\ru-RU\RdlReader.resources.dll /Y

cd build-output	
..\7za.exe a %Version%-majorsilence-reporting-build-dot-net-2-x64.zip majorsilence-reporting-build-dot-net-2-x64\
cd ..

REM ************* End x64 *********************************************


REM ************* Begin x86 *********************************************

"C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe" "%CD%\..\MajorsilenceReporting-35.sln" /v:q /toolsversion:4.0 /p:Configuration="Release";Platform="x86";TargetFrameworkVersion=v3.5 /t:clean;rebuild /m:4

rmdir .\build-output\majorsilence-reporting-build-dot-net-2-x86 /s /q
mkdir .\build-output\majorsilence-reporting-build-dot-net-2-x86

copy ..\DataProviders\bin\Release\DataProviders.dll .\build-output\majorsilence-reporting-build-dot-net-2-x86\DataProviders.dll /Y
copy ..\RdlCmd\bin\x86\Release\RdlCmd.exe .\build-output\majorsilence-reporting-build-dot-net-2-x86\RdlCmd.exe /Y
copy ..\RdlCri\bin\Release\RdlCri.dll .\build-output\majorsilence-reporting-build-dot-net-2-x86\RdlCri.dll /Y
copy ..\RdlEngine\bin\Release\RdlEngine.dll .\build-output\majorsilence-reporting-build-dot-net-2-x86\RdlEngine.dll /Y
copy ..\RdlEngine\bin\Release\ICSharpCode.SharpZipLib.dll .\build-output\majorsilence-reporting-build-dot-net-2-x86\ICSharpCode.SharpZipLib.dll /Y
copy ..\RdlEngine\bin\Release\System.Data.SQLite.dll .\build-output\majorsilence-reporting-build-dot-net-2-x86\System.Data.SQLite.dll /Y
copy ..\RdlEngine\bin\Release\RdlEngineConfig.xml .\build-output\majorsilence-reporting-build-dot-net-2-x86\RdlEngineConfig.xml /Y
copy ..\RdlViewer\bin\Release\RdlViewer.dll .\build-output\majorsilence-reporting-build-dot-net-2-x86\RdlViewer.dll /Y
copy ..\RdlViewer\RdlReader\bin\x86\Release\RdlReader.exe .\build-output\majorsilence-reporting-build-dot-net-2-x86\RdlReader.exe /Y
copy ..\RdlAsp\bin\Release\RdlAsp.dll .\build-output\majorsilence-reporting-build-dot-net-2-x86\RdlAsp.dll /Y
copy ..\RdlMapFile\bin\x86\Release\RdlMapFile.exe .\build-output\majorsilence-reporting-build-dot-net-2-x86\RdlMapFile.exe /Y
copy ..\RdlDesktop\bin\x86\Release\RdlDesktop.exe .\build-output\majorsilence-reporting-build-dot-net-2-x86\RdlDesktop.exe /Y
copy ..\RdlDesktop\bin\x86\Release\config.xml .\build-output\majorsilence-reporting-build-dot-net-2-x86\config.xml /Y
copy ..\LibRdlWpfViewer\bin\Release\LibRdlWpfViewer.dll .\build-output\majorsilence-reporting-build-dot-net-2-x86\LibRdlWpfViewer.dll /Y

copy "..\packages\ZXing.Net.0.14.0.1\lib\net35\zxing.dll" .\build-output\majorsilence-reporting-build-dot-net-2-x86\zxing.dll
copy "..\packages\iTextSharp-LGPL.4.1.6\lib\iTextSharp.dll" .\build-output\majorsilence-reporting-build-dot-net-2-x86\iTextSharp.dll /Y

mkdir .\build-output\majorsilence-reporting-build-dot-net-2-x86\ru-RU
copy ..\RdlDesktop\bin\x86\Release\ru-RU\RdlDesktop.resources.dll .\build-output\majorsilence-reporting-build-dot-net-2-x86\ru-RU\RdlDesktop.resources.dll /Y
copy ..\RdlEngine\bin\Release\ru-RU\RdlEngine.resources.dll .\build-output\majorsilence-reporting-build-dot-net-2-x86\ru-RU\RdlEngine.resources.dll /Y
copy ..\RdlMapFile\bin\x86\Release\ru-RU\RdlMapFile.resources.dll .\build-output\majorsilence-reporting-build-dot-net-2-x86\ru-RU\RdlMapFile.resources.dll /Y
copy ..\RdlViewer\bin\Release\ru-RU\RdlViewer.resources.dll .\build-output\majorsilence-reporting-build-dot-net-2-x86\ru-RU\RdlViewer.resources.dll /Y
copy ..\RdlViewer\RdlReader\bin\x86\Release\ru-RU\RdlReader.resources.dll .\build-output\majorsilence-reporting-build-dot-net-2-x86\ru-RU\RdlReader.resources.dll /Y

cd build-output
..\7za.exe a %Version%-majorsilence-reporting-build-dot-net-2-x86.zip majorsilence-reporting-build-dot-net-2-x86\
cd ..
REM ************* End x86 *********************************************



