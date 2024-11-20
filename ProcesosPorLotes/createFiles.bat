@echo off
REM Ejercicioentregable de práctica con if
REM Fecha:20-11-24
REM Autor: Toni Carretero Barroso

set /P opcion="Opcion 1: txt Opcion 2: bat "


if %opcion%== 1 goto archivo.txt
if %opcion%== 2 goto archivo.bat

:archivo.txt
set /P nombrearchivo="Introduzca el nombre del archivo "

echo > %nombrearchivo%.txt

pause
exit

:archibo.bat
set /P nombrearchivo="Introduzca el nombre del archivo "

echo > %nombrearchivo%.bat

pause
exit

