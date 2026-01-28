REM Check if Python 3.10 is installed
py -3.10 --version >nul 2>&1
if errorlevel 1 (
    echo Python 3.10 not found. Installing Python 3.10 via winget...
    winget install Python.Python.3.10 --silent --accept-source-agreements --accept-package-agreements
    echo Please restart this script after Python 3.10 installation completes.
    pause
    exit /b
)

REM Check if .venv exists
if not exist ".venv" (
    echo Creating virtual environment with Python 3.10...
    py -3.10 -m venv .venv
) else (
    echo Virtual environment already exists.
)


REM Activate virtual environment
call .venv\Scripts\activate.bat

REM Install packages
echo Installing packages...
pip install uv
uv pip install pandas numpy matplotlib seaborn ipykernel altair scipy scikit-learn umap-learn
pause