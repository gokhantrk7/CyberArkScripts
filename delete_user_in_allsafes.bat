@echo on

set PACLI="C:\PACLI\PACLI.EXE"
	
call %PACLI% INIT
call %PACLI% DEFINEFROMFILE PARMFILE=Vault.ini
call %PACLI% DEFAULT VAULT="Vault" USER=administrator
call %PACLI% LOGON LOGONFILE=pacli.cred 



FOR /F %%i IN (safelist.txt) DO call %PACLI% OPENSAFE SAFE=%%i



FOR /F %%i IN (safelist.txt) DO call %PACLI% DELETEUSER OWNER=usertodelete SAFE=%%i





@FOR /F %%i IN (safelist.txt) DO call %PACLI% CLOSESAFE SAFE= %%i


call %PACLI% LOGOFF VAULT="Vault" USER=administrator

call %PACLI% TERM