@echo off

REM prepare vc environment

call "%VS90COMNTOOLS%vsvars32.bat"

echo Start build cm_server ...
cd win

set cubrid_libdir=%cubrid_libdir%
set cubrid_includedir=%cubrid_includedir%

cmd /c devenv cmserver.sln /project install /rebuild "%mode%|%platform%"
set exitcode=%errorlevel%
cd ..
if not "%exitcode%" == "0" exit /b %exitcode%

cd win/install
cd CMServer_%mode%_%platform%

if not exist "%prefix%\bin" (
	mkdir %prefix%\bin
)
if not exist "%prefix%\conf" (
	mkdir %prefix%\conf
)
copy bin\*.* %prefix%\bin
copy conf\*.* %prefix%\conf
xcopy share %prefix%\share\ /E /Y
cd ..\..\..

