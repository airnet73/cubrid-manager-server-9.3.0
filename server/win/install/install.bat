@echo off

if "%1" == "" goto exit
if "%2" == "" goto exit

set SRC_DIR=%1
set DEST_DIR=%2

mkdir %DEST_DIR%
mkdir %DEST_DIR%\bin
mkdir %DEST_DIR%\conf
mkdir %DEST_DIR%\share

copy %SRC_DIR%\*.exe %DEST_DIR%\bin
copy %SRC_DIR%\*.pdb %DEST_DIR%\bin

copy %SRC_DIR%\..\..\cmserver\conf\*.conf %DEST_DIR%\conf
copy %SRC_DIR%\..\..\cmserver\conf\*.pass %DEST_DIR%\conf
copy %SRC_DIR%\..\..\cmserver\conf\cm_ssl_cert.* %DEST_DIR%\conf
xcopy %SRC_DIR%\..\..\share %DEST_DIR%\share /E /Y

:EXIT
