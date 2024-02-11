@echo off
echo ffmpeg Video Combining Batch Script (ffcombine) 
echo Made by TheDuccinator
pause
cls

if EXIST "ffmpeg.exe" goto found

if NOT EXIST "ffmpeg.exe" echo ffmpeg is not in the directory. 
goto borked

:borked
pause 
cls
exit

:found
echo ffmpeg found.


:filename 
echo Enter or drag the path for the txt file: 
set /p p=
cls

echo Wanna name the output video?
set /p vid="0 for No (named "output" by default), 1 for Yes: "
if %vid%==0 (goto defname)
if %vid%==1 (goto vidname)
cls

:vidname
echo Enter the name for the output file: 
set /p v=
goto rendalt
cls

:defname
set v="output"

echo Now combining the videos.

pause
cls

if EXIST "output.mkv" echo The output file already exist. Wanna overwrite it?
set /p choice="0 for No, 1 for Yes: "
if %choice%==0 (goto vidname)
if %choice%==1 (goto render)
cls

:rendalt
echo Now combining the videos.

pause
cls
:render
ffmpeg.exe -y -f concat -safe 0 -i "%p%" -acodec copy -vcodec copy -preset ultrafast "%v%.mkv"

cls
echo Combining completed!
pause
exit
