@echo off]
set pathToScript=C:/Users/sasha/Desktop/MyRepositories
cd %pathToScript%
echo %pathToScript%
start "" "%PROGRAMFILES%\Git\bin\sh.exe" --login -i -- AutoGitPullScript.bash
pause
