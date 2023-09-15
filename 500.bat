@echo off
setlocal enabledelayedexpansion

set "sourceFolder=%~dp0"
set "destinationFolder=%~dp0X1"
set "filePrefix=part"
set "fileExtension=ts"

rem Kiểm tra nếu thư mục đích không tồn tại, tạo nó
if not exist "!destinationFolder!" (
    mkdir "!destinationFolder!"
    echo Created destination folder: !destinationFolder!
)

rem Bắt đầu vòng lặp từ 0 đến 499
for /L %%i in (0,1,499) do (
    set "sourceFile=!sourceFolder!!filePrefix!%%i.!fileExtension!"
    set "destinationFile=!destinationFolder!!filePrefix!%%i.!fileExtension!"
    
    rem Kiểm tra nếu tệp tin tồn tại, sau đó sao chép nó
    if exist "!sourceFile!" (
        move "!sourceFile!" "!destinationFile!"
        echo Moved !sourceFile! to !destinationFile!
    ) else (
        echo File !sourceFile! not found.
    )
)

endlocal
