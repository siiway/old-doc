@echo off

cd.
echo Starting Http Server at [localhost:3001]

if "%COMPUTERNAME%" == "WYF9" (
    python -m http.server 3001
) else if "%COMPUTERNAME%" == "xxx" (
    python -m http.server 3001
) else (
    py -m http.server 3001
)

echo Server Exited.
echo Return: %ERRORLEVEL%
