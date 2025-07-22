@echo off

set local_dir=%USERPROFILE%\STAGE2025_workshop_theme2
if not exist "%local_dir%" mkdir "%local_dir%"

docker run -ti --rm ^
    -p 8888:8888 ^
    -v "%local_dir%":/workshop/local ^
    ghcr.io/pgx-ml-lab/stage2025_theme2:latest

echo Exiting!