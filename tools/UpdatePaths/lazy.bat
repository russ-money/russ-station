@echo off
set "start_date=2023/10/28"
set "end_date=2023/12/09"
for /f "delims=" %%A in ('powershell -Command "Get-ChildItem -Path .\Scripts\*.txt | Where-Object { $_.LastWriteTime -ge '%start_date%' -and $_.LastWriteTime -le '%end_date%' } | Sort-Object LastWriteTime | ForEach-Object { $_.FullName }"') do (
    call "%~dp0\..\bootstrap\python" -m UpdatePaths "%%A"
)
pause
