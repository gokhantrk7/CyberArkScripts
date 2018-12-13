@echo on

set PACLI="D:\Program Files (x86)\CyberArk\PACLI\Pacli.exe"
	
call %PACLI% INIT
call %PACLI% DEFINEFROMFILE PARMFILE=Vault.ini
call %PACLI% DEFAULT VAULT="Vault" USER="sectoolbg"
call %PACLI% LOGON LOGONFILE=pacli.cred


FOR /F "tokens=1-2 delims=," %%a IN (groupmemberlist.txt) DO (call %PACLI% ADDGROUP VAULT="vault" USER=sectoolbg GROUP="%%a" LOCATION="\%%b")



call %PACLI% LOGOFF VAULT="Vault" USER=sectoolbg

call %PACLI% TERM
