@echo off]
set pathToScript=C:/Users/sasha/Desktop/Radar
cd %pathToScript%
echo %pathToScript%
start "" "%PROGRAMFILES%\Git\bin\sh.exe" --login -i -- AutoGitPullScript.bash
pause