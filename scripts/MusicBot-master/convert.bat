@echo off

@set loopcount = 0
::checks till cache clear
@set ctcc = 10

:start

@set /a loopcount = %loopcount% + 1
echo %loopcount%

for /R "audio_cache" %%a in ("*.*") DO ( 
ffmpeg -i "%%a" -n -c:v libx264 -preset slow -crf 20 -b:a 128k "newfiles\%%~na.mp3" 
)




echo "passed"

beet import -a -w -c -s -q newfiles
echo %loopcount%
timeout /t 500


if %loopcount% == 10 goto delcache

goto start

 
:delcache
echo "going to delcache"

@set /a loopcount = %loopcount% * 0


for /R "audio_cache" %%a in ("*.*") DO (
del %%a
echo %%a
) 

for /R "newfiles" %%a in ("*.*") DO (
del %%a
echo %%a
) 

goto start
