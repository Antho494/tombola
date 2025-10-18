@echo off
set "REPO_PATH=C:\Comp\Stream\_Stream"
set "FILE_NAME=donors.json"
set "BRANCH=main"
set "COMMIT_MSG=Mise à jour automatique des dons"

echo.
cd /d "%REPO_PATH%" || (
    echo Impossible d'accéder au dossier %REPO_PATH%
    pause
    exit /b
)

:: Vérifie si Git est dispo
git --version >nul 2>&1
if errorlevel 1 (
    echo Git n'est pas installé ou pas dans le PATH.
    pause
    exit /b
)

:: Vérifie si le fichier existe
if not exist "%FILE_NAME%" (
    echo Fichier introuvable : %FILE_NAME%
    pause
    exit /b
)

echo.
git add "%FILE_NAME%"

echo.
git commit -m "%COMMIT_MSG%" >nul 2>&1

echo.
echo ⬆️ Envoi vers GitHub (%BRANCH%)...
git push origin "%BRANCH%"
if errorlevel 1 (
    echo Erreur pendant le push. Vérifie ta connexion ou tes permissions GitHub.
    pause
    exit /b
)

echo.
echo Donors.json mis à jour sur GitHub avec succès !
