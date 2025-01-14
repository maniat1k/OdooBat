@echo off
title Instalación de Odoo
color 0A
echo Iniciando la instalación de Odoo...

REM Verificar si PowerShell está disponible
where powershell >nul 2>&1
if %errorlevel% neq 0 (
    echo PowerShell no está disponible. Por favor, instálalo antes de continuar.
    pause
    exit /b
)

REM Crear y ejecutar el script de PowerShell
echo Creando script temporal de PowerShell...
set scriptPath=%TEMP%\Install-Odoo.ps1

(
echo Write-Host "Iniciando instalación de Odoo..." -ForegroundColor Green
echo
echo # Función para agregar rutas al PATH
echo Function Add-ToPath {
echo ^[System.Environment]::SetEnvironmentVariable("PATH", $env:PATH + ";$args[0]", [System.EnvironmentVariableTarget]::Machine)
echo }
echo
echo # Verificar PostgreSQL
echo Function Install-Postgres {
echo     $pgInstaller = "https://get.enterprisedb.com/postgresql/postgresql-14.9-1-windows-x64.exe"
echo     $pgInstallerPath = "$env:TEMP\postgres_installer.exe"
echo     if (-Not (Get-Command "psql.exe" -ErrorAction SilentlyContinue)) {
echo         Write-Host "PostgreSQL no encontrado. Instalando..."
echo         Invoke-WebRequest -Uri $pgInstaller -OutFile $pgInstallerPath
echo         Start-Process -FilePath $pgInstallerPath -ArgumentList "--mode unattended --superpassword odoo --datadir C:\PostgreSQL\data" -Wait
echo     }
echo }
echo
echo # Verificar Python
echo Function Install-Python {
echo     if (-Not (Get-Command "python" -ErrorAction SilentlyContinue)) {
echo         Write-Host "Python no encontrado. Instalando..."
echo         $pythonInstaller = "https://www.python.org/ftp/python/3.11.6/python-3.11.6-amd64.exe"
echo         $pythonInstallerPath = "$env:TEMP\python_installer.exe"
echo         Invoke-WebRequest -Uri $pythonInstaller -OutFile $pythonInstallerPath
echo         Start-Process -FilePath $pythonInstallerPath -ArgumentList "/quiet InstallAllUsers=1 PrependPath=1" -Wait
echo     }
echo }
echo
echo # Verificar Git
echo Function Install-Git {
echo     if (-Not (Get-Command "git" -ErrorAction SilentlyContinue)) {
echo         Write-Host "Git no encontrado. Instalando..."
echo         $gitInstaller = "https://github.com/git-for-windows/git/releases/download/v2.42.0.windows.1/Git-2.42.0-64-bit.exe"
echo         $gitInstallerPath = "$env:TEMP\git_installer.exe"
echo         Invoke-WebRequest -Uri $gitInstaller -OutFile $gitInstallerPath
echo         Start-Process -FilePath $gitInstallerPath -ArgumentList "/VERYSILENT /NORESTART" -Wait
echo     }
echo }
echo
echo # Verificar Node.js
echo Function Install-NodeJS {
echo     if (-Not (Get-Command "node" -ErrorAction SilentlyContinue)) {
echo         Write-Host "Node.js no encontrado. Instalando..."
echo         $nodeInstaller = "https://nodejs.org/dist/v18.18.0/node-v18.18.0-x64.msi"
echo         $nodeInstallerPath = "$env:TEMP\node_installer.msi"
echo         Invoke-WebRequest -Uri $nodeInstaller -OutFile $nodeInstallerPath
echo         Start-Process -FilePath $nodeInstallerPath -ArgumentList "/quiet" -Wait
echo     }
echo }
echo
echo # Instalar Odoo
echo Install-Postgres
echo Install-Python
echo Install-Git
echo Install-NodeJS
echo Write-Host "Instalación completada." -ForegroundColor Green
) > "%scriptPath%"

REM Ejecutar el script en PowerShell
powershell -ExecutionPolicy Bypass -File "%scriptPath%"
echo Instalación completa.
pause
