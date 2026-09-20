@echo off
echo Stopping existing Node and Vite processes on ports 8787 and 5173...
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :8787') do taskkill /F /PID %%a 2>nul
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :5173') do taskkill /F /PID %%a 2>nul
echo Done! You can now run .\start-dev.bat again.
