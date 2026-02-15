@echo off
setlocal
echo ==========================================
echo    Installing Jupyter Book 1.0.3 (VENV)
echo ==========================================

:: Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Python not found. Please install Python first.
    pause
    exit /b 1
)

echo [1/6] Creating Virtual Environment (venv)...
python -m venv venv

echo [2/6] Activating Virtual Environment...
call venv\Scripts\activate

echo [3/6] Installing Requirements...
python -m pip install --upgrade pip
pip install -r scripts\requirements-install.txt

echo [4/6] Initializing Project...
if not exist Pendat (
    jupyter-book create Pendat
)

echo Building Jupyter Book...
jupyter-book build Pendat/

echo [5/6] Moving contents to Root...
xcopy /E /H /Y Pendat .

echo [6/6] Cleaning up Pendat folder...
rmdir /S /Q Pendat

:: Create .nojekyll in root
echo. > .nojekyll

echo [8/8] Cleaning up sample files...
del /F /Q markdown.md markdown-notebooks.md notebooks.ipynb 2>nul

echo [7/7] Publishing to /docs...
call scripts\publish.bat

echo ==========================================
echo    Process Finished ^& Published!
echo    Venv: Active
echo    Output: _build\ and docs\ folders
echo ==========================================
pause