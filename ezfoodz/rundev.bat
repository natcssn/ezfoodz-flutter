@echo off
echo 🚀 Starting Flutter + FastAPI...

REM Start Flutter in a new terminal
start cmd /k "flutter run"

REM Go to FastAPI folder and start uvicorn
cd /d ../fastapi
start cmd /k "uvicorn main:app --reload --port 8000"

echo ✅ Both services started!
pause
