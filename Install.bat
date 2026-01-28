REM Check if Python 3.10 is installed
py -3.10 --version >nul 2>&1
if errorlevel 1 (
    echo Installing Python 3.10 for Umap package compatibility
    winget install Python.Python.3.10 --silent --accept-source-agreements --accept-package-agreements
    echo Python 3.10 installation completed.
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
echo Installing packages. Use uv for faster installation.
pip install uv
uv pip install pandas numpy matplotlib seaborn ipykernel altair scipy scikit-learn umap-learn