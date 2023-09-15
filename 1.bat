@echo off
setlocal enabledelayedexpansion

set sourceFolder=C:\Users\opc\Downloads\Compressed
set destinationFolder=C:\Users\opc\Downloads\Compressed\X2
set filePrefix=part
set fileExtension=ts

rem Bắt đầu vòng lặp từ 0 đến 499
for /L %%i in (500,1,999) do (
    set "sourceFile=!sourceFolder!\!filePrefix!%%i.!fileExtension!"
    set "destinationFile=!destinationFolder!\!filePrefix!%%i.!fileExtension!"
    
    rem Kiểm tra nếu tệp tin tồn tại, sau đó sao chép nó
    if exist "!sourceFile!" (
        move "!sourceFile!" "!destinationFile!"
        echo Moved !sourceFile! to !destinationFile!
    ) else (
        echo File !sourceFile! not found.
    )
)

endlocal