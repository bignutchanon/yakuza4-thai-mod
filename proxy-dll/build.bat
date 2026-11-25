@echo off
setlocal
call "C:\Program Files (x86)\Microsoft Visual Studio\18\BuildTools\VC\Auxiliary\Build\vcvars64.bat" >nul
cd /d "%~dp0"
cl /nologo /LD /O2 /EHsc /GS- /std:c++17 dinput8.cpp /Fe:dinput8.dll /link /DLL kernel32.lib user32.lib
if errorlevel 1 exit /b 1
del dinput8.obj dinput8.exp dinput8.lib 2>nul
echo BUILT dinput8.dll
