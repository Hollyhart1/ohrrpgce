REM *WARNING* Scheduling this batch file to be automatically
REM run is equivalent to allowing any developer with write access
REM to the repository full control of your build computer. Thank
REM goodness James trusts the other devs ;)

set SCONS_ARGS= debug=0 gengcc=1

cd c:\nightly\ohrrpgce
svn cleanup
svn update
svn info > svninfo.txt

CALL distrib.bat nightly
CALL distver.bat
pscp -q distrib\ohrrpgce-win-installer-%OHRVERDATE%-%OHRVERCODE%.exe james_paige@motherhamster.org:HamsterRepublic.com/ohrrpgce/nightly/ohrrpgce-wip-win-installer.exe

del hspeak.exe unlump.exe relump.exe
CALL scons hspeak relump unlump %SCONS_ARGS%

del game*.exe custom*.exe
call scons music=sdl %SCONS_ARGS%
call nightly-gfx-music music_sdl gfx_directx.dll SDL.dll SDL_mixer.dll

del game*.exe custom*.exe
call scons music=native %SCONS_ARGS%
call nightly-gfx-music music_native gfx_directx.dll SDL.dll audiere.dll

del game*.exe custom*.exe
call scons music=native2 %SCONS_ARGS%
call nightly-gfx-music music_native2 gfx_directx.dll SDL.dll audiere.dll

del game*.exe custom*.exe
call scons music=silence %SCONS_ARGS%
call nightly-gfx-music music_silence gfx_directx.dll SDL.dll

REM del game*.exe custom*.exe
REM call scons gfx=alleg+directx+fb+sdl music=sdl %SCONS_ARGS%
REM call nightly-gfx-music gfx_alleg-music_sdl alleg40.dll SDL.dll SDL_mixer.dll

del game*.exe custom*.exe
call scons music=sdl debug=2
call nightly-gfx-music music_sdl-debug gfx_directx.dll SDL.dll SDL_mixer.dll misc\gdbcmds1.txt misc\gdbcmds2.txt gdbgame.bat gdbcustom.bat

REM Note that this is duplicated in distrib-nightly-linux.sh
Echo upload plotdict.xml
pscp -q docs\plotdict.xml james_paige@motherhamster.org:HamsterRepublic.com/ohrrpgce/nightly/docs/
pscp -q docs\htmlplot.xsl james_paige@motherhamster.org:HamsterRepublic.com/ohrrpgce/nightly/docs/

del distrib\ohrrpgce-util.zip
IF NOT EXIST unlump.exe GOTO NOUTIL
IF NOT EXIST relump.exe GOTO NOUTIL
support\zip distrib\ohrrpgce-util.zip unlump.exe relump.exe LICENSE-binary.txt svninfo.txt
pscp -q distrib\ohrrpgce-util.zip james_paige@motherhamster.org:HamsterRepublic.com/ohrrpgce/nightly/
:NOUTIL

del distrib\hspeak-win-nightly.zip
IF NOT EXIST hspeak.exe GOTO NOHSPEAK
support\zip distrib\hspeak-win-nightly.zip hspeak.exe hspeak.exw hsspiffy.e euphoria\*.e euphoria\License.txt LICENSE.txt plotscr.hsd scancode.hsi
pscp -q distrib\hspeak-win-nightly.zip james_paige@motherhamster.org:HamsterRepublic.com/ohrrpgce/nightly/
:NOHSPEAK

del distrib\bam2mid.zip
del bam2mid.exe
call scons bam2mid.exe
IF NOT EXIST bam2mid.exe GOTO NOBAM2MID
support\zip distrib\bam2mid.zip bam2mid.exe bam2mid.txt LICENSE.txt svninfo.txt
pscp -q distrib\bam2mid.zip james_paige@motherhamster.org:HamsterRepublic.com/ohrrpgce/nightly/
:NOBAM2MID

del distrib\madplay+oggenc.zip
support\zip distrib\madplay+oggenc.zip support\madplay.exe support\oggenc.exe support\LICENSE-*.txt LICENSE.txt
pscp -q distrib\madplay+oggenc.zip james_paige@motherhamster.org:HamsterRepublic.com/ohrrpgce/nightly/

pscp -q svninfo.txt james_paige@motherhamster.org:HamsterRepublic.com/ohrrpgce/nightly/
