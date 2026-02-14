@echo off
setlocal
echo ==========================================
echo    Deploying Jupyter Book (Built-in Sys)
echo ==========================================

:: Activate venv
if exist venv\Scripts\activate (
    call venv\Scripts\activate
) else (
    echo [ERROR] venv tidak ditemukan. Jalankan install.bat terlebih dahulu.
    pause
    exit /b 1
)

:: Step 1: Build (Sesuai cara sistem, jupyter-book ngebaca glob di _toc.yml)
echo [1/3] Building Jupyter Book...
jupyter-book build .

:: Step 2: Prepare docs folder
echo [2/3] Preparing /docs folder...
if exist docs rmdir /S /Q docs
mkdir docs

:: Step 3: Copy HTML files to docs
echo [3/3] Copying build files to /docs...
xcopy /E /H /Y _build\html docs\

:: Create .nojekyll
echo. > docs\.nojekyll

echo ==========================================
echo    Selesai! Sistem Berjalan di /docs
echo ==========================================
pause
