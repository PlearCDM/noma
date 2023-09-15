@echo off
setlocal enabledelayedexpansion

set input_file=tt9362722.mp4

echo Video Codec:
for /f "tokens=*" %%a in ('ffmpeg -i !input_file! 2^>^&1 ^| find "Stream #0:0"') do (
    set line=%%a
    set line=!line:*Video: =!
    set line=!line:,*=!
    echo !line!
)

echo Audio Codec:
for /f "tokens=*" %%a in ('ffmpeg -i !input_file! 2^>^&1 ^| find "Stream #0:1"') do (
    set line=%%a
    set line=!line:*Audio: =!
    set line=!line:,*=!
    echo !line!
)

endlocal
