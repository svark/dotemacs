call "C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\vcvarsall.bat" x86
set inputdir=C:\apps\asti\build\svark_asti\
set one=%1
set selfile=%one:test_flymake.cpp=_flymake.cpp%
if "%selfile%"=="%one%" (
set bldfile=svark_asti.vcxproj
)else (
set bldfile=svark_asti_test_main.vcxproj
)
echo %selfile% > %TEMP%\b.txt
set outputdir=%TEMP%

echo transforming existing build file to allow flymake compilation
c:\apps\xmlstar\xmlstarlet-1.6.1\xml.exe tr %~dp0mod.xsl %inputdir%%bldfile% > %outputdir%\%bldfile%
call msbuild "%outputdir%\%bldfile%" /t:ClCompile /p:SelectedFiles="%1" /p:PlatformToolset=v110
