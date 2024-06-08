@echo off
setlocal enabledelayedexpansion

REM Define source and target directories
set "SOURCE_DIR=..\next-auth-setup"
set "TARGET_DIR=..\new-project"

REM List of directories and files to copy
set ITEMS_TO_COPY=(
    "app\Auth"
)

REM Split ITEMS_TO_COPY and copy each item
for %%I in (%ITEMS_TO_COPY%) do (
    if exist "%SOURCE_DIR%\%%~I" (
        if exist "%SOURCE_DIR%\%%~I\" (
            xcopy "%SOURCE_DIR%\%%~I" "%TARGET_DIR%\%%~I" /E /I /Y
        ) else (
            REM Ensure the target directory exists before copying the file
            if not exist "%TARGET_DIR%\%%~dpI" mkdir "%TARGET_DIR%\%%~dpI"
            copy "%SOURCE_DIR%\%%~I" "%TARGET_DIR%\%%~dpI" /Y
        )
    )
)

echo Auth setup copied successfully!
pause
