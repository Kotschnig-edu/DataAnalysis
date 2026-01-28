REM Check if .venv exists
if not exist ".venv" (
    echo Creating virtual environment...+
    py install 3.10.0
    py -3.10.0 -m venv .venv
) else (
    echo Virtual environment already exists.
)

REM Activate virtual environment
call .venv\Scripts\activate.bat

REM Install packages
echo Installing packages...
pip install uv
uv pip install pandas numpy matplotlib seaborn ipykernel altair scipy scikit-learn umap-learn
