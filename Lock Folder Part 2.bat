@echo off
title Folder Locker
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK
if NOT EXIST Locker goto MDLOCKER
:CONFIRM
echo Apakah Anda ingin mengunci folder ini? (Y/N)
set/p "cho=>"
if %cho%==Y goto SETPASSWORD
if %cho%==y goto SETPASSWORD
if %cho%==N goto END
if %cho%==n goto END
echo Pilihan tidak valid.
goto CONFIRM

:SETPASSWORD
echo Masukkan password untuk mengunci folder:
set/p "lockpass=>"
goto LOCK

:LOCK
ren Locker "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
echo Folder terkunci.
goto End

:UNLOCK
echo Masukkan password untuk membuka folder:
set/p "pass=>"
if NOT %pass%==%lockpass% goto FAIL
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" Locker
echo Folder terbuka.
goto End

:FAIL
echo Password salah.
goto end

:MDLOCKER
md Locker
echo Folder Locker telah dibuat.
goto End

:End
