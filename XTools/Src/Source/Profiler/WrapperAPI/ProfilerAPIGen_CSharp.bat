
echo Building CSharp Wrapper API...

set DEST=..\..\..\GeneratedInterface\Profiler\CSharpAPI

if exist %DEST% del /F %DEST%\*.cs
if not exist %DEST% mkdir %DEST%

..\..\..\External\swigwin-3.0.2\swig.exe -Fmicrosoft -c++ -csharp -D%2 -D%3 %5 -namespace XTools -dllimport %1 -outdir %DEST% -o ..\ProfilerWrapperAPI_CSharp.cpp -includeall %4
IF NOT %ERRORLEVEL% == 0 goto BuildError

echo ...Completed Successfully
exit /b 0

:BuildError
echo ***********************************
echo * Profiler CSharp Wrapper API Build Failed *
echo ***********************************
exit /b 1