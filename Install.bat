REM Check if .venv exists
if not exist ".venv" (
    echo Creating virtual environment...
    python -m venv .venv
) else (
    echo Virtual environment already exists.
)

REM Activate virtual environment
call .venv\Scripts\activate.bat

REM Install packages
echo Installing packages...
pip install uv
uv pip install pandas numpy matplotlib seaborn ipykernel altair
