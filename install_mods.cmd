@echo off
chcp 65001 > nul
:: Verifier si le script est execute en mode administrateur
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Demande d'elevation des privileges...
    powershell -Command "Start-Process cmd -ArgumentList '/c \"%~f0\"' -Verb RunAs"
    exit /b
)

setlocal

:: Definition des chemins
set "SOURCE=%~dp0Pal"
set "DEST=C:\Program Files (x86)\Steam\steamapps\common\Palworld\Pal"

:: Verifier si le dossier source existe
if not exist "%SOURCE%" (
    echo ERREUR : Le dossier source "Pal" n'existe pas dans le repertoire du script.
    pause
    exit /b
)

:: Creer le dossier de destination s'il n'existe pas
if not exist "%DEST%" (
    echo Creation du dossier de destination "Pal"...
    mkdir "%DEST%"
)

:: Copier et fusionner le contenu (remplace les fichiers existants)
echo Copie des fichiers en cours...
xcopy "%SOURCE%" "%DEST%" /E /I /Y > nul

:: Verification de la copie
if %errorlevel% neq 0 (
    echo ERREUR : La copie du dossier "Pal" a echoue.
    pause
    exit /b
) else (
    echo Copie terminee avec succes. Les fichiers ont ete fusionnes dans "%DEST%".
)

endlocal
pause
