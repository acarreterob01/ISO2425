@echo off
REM Ejercicioentregable de práctica con if 2
REM Fecha:20-11-24
REM Autor: Toni Carretero Barroso

set /P opcion="Opcion 1: crear fichero Opcion 2: arbol de dir Opcion 3: archivos txt Opcion 4: Crear directorios Opcion 5: copiar contenido al Escritorio "

if %opcion%== 1 goto fichero
if %opcion%== 2 goto arbol
if %opcion%== 3 goto ar.txt
if %opcion%== 4 goto direct
if %opcion%== 5 goto copiarcont.

:fichero
set /P nombrefich="Introduzca un nombre para su fichero "
echo > %nombrefich%.txt

pause
exit
:arbol
tree %userprofile%

pause
exit
:ar.txt
dir *.txt

pause
exit
:direct
mkdir alfredoff marinapg ramonam

pause
exit
:copiarcont.
xcopy /E %userprofile% c:\copia

pause
exit

