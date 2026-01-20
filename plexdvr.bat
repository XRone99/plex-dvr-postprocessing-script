SET infile=%1
SET tmpfile=%1.mp4
SET scriptlog=[full path to log file]

ECHO.
ECHO Starting processing %date% %time%>> %scriptlog%

ECHO Starting ffmpeg file conversion %date% %time%>> %scriptlog%

REM use ffmpeg to convert the ts back into a HEVC ts
ffmpeg -hwaccel cuda -hwaccel_output_format cuda -i %infile% -f mpegts -c:v hevc_nvenc -preset slow -y %tmpfile%

ECHO Finished conversion %date% %time%>> %scriptlog%
ECHO Moving file %tmpfile% to %infile%>> %scriptlog%

REM replace the original ts file with the compressed version
move /Y %tmpfile% %infile%

ECHO Finished moving>> %scriptlog%

ECHO Finished processing %date% %time%>> %scriptlog%
ECHO.
ECHO.
