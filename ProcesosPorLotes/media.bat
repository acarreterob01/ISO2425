@echo off
REM Media por línea de comandos
REM Voy a hacer la media de 3 números

set num1=%1

set num2=%2

set num3=%3

set /A sum= %1 + %2 + %3

set /A media= sum/3

echo La media de %1, %2 y %3 es %media%