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
pip install -r requirements-install.txt

echo [4/6] Creating and Building 'Pendat' Folder...
:: Create a template book in 'Pendat' if it doesn't exist
if not exist Pendat (
    jupyter-book create Pendat
)

:: Build the book
echo Building Jupyter Book...
jupyter-book build Pendat/

echo [5/6] Moving all contents from Pendat to Root...
:: Move everything from Pendat to the current directory
xcopy /E /H /Y Pendat .

echo [6/6] Cleaning up Pendat folder...
:: Remove Pendat folder as requested
rmdir /S /Q Pendat

:: Create .nojekyll in root
echo. > .nojekyll

echo [7/7] Auto-Generating Table of Contents (_toc.yml)...
powershell -Command ^
    "$ignore = @('intro.md', 'README.md', 'requirements.txt', 'requirements-install.txt', '.nojekyll'); ^
    $files = Get-ChildItem -Path . -Include *.md, *.ipynb -Recurse | Where-Object { $_.Name -notin $ignore -and $_.FullName -notmatch 'venv|_build|docs' }; ^
    $nonNumbered = $files | Where-Object { $_.Name -notmatch '^\d+' } | Sort-Object Name; ^
    $numbered = $files | Where-Object { $_.Name -match '^\d+' } | Sort-Object { [int]($_.Name -replace '^(\d+).*', '$1') }; ^
    $finalList = $nonNumbered + $numbered; ^
    $toc = 'format: jb-book' + \"`n\" + 'root: intro' + \"`n\" + 'chapters:'; ^
    foreach ($f in $finalList) { ^
        $relPath = (Resolve-Path -Path $f.FullName -Relative) -replace '^\.\\', '' -replace '\.(md|ipynb)$', '' -replace '\\', '/'; ^
        $toc += \"`n\" + '- file: ' + $relPath; ^
    }; ^
    $toc | Out-File -FilePath _toc.yml -Encoding ASCII"

echo ==========================================
echo    Process Finished! 
echo    Venv: Active (use 'call venv\Scripts\activate' next time)
echo    Build: results in '_build' folder
echo    Sidebar: Auto-generated (_toc.yml)
echo ==========================================
pause