@echo on

set PACLI="C:\PACLI\PACLI.EXE"
	
call %PACLI% INIT
call %PACLI% DEFINEFROMFILE PARMFILE=Vault.ini
call %PACLI% DEFAULT VAULT="Vault" USER=administrator
call %PACLI% LOGON LOGONFILE=pacli.cred 



FOR /F %%i IN (safelist.txt) DO call %PACLI% OPENSAFE SAFE=%%i




FOR /F %%i IN (safelist.txt) DO call %PACLI% UPDATESAFE SAFE=%%i SAFEOPTIONS=704


FOR /F %%i IN (safelist.txt) DO call %PACLI% ADDSAFESHARE SAFE=%%i GWACCOUNT="PVWAGWAccounts"

FOR /F %%i IN (safelist.txt) DO call %PACLI%  ADDOWNER VAULT="Vault" USER=administrator OWNER=PasswordManager SAFE=%%i RETRIEVE=YES STORE=YES DELETE=YES ADMINISTER=NO SUPERVISE=NO BACKUP=NO MANAGEOWNERS=NO ACCESSNOCONFIRMATION=YES VALIDATESAFECONTENT=NO LIST=YES 

FOR /F %%i IN (safelist.txt) DO call %PACLI% CLOSESAFE SAFE= %%i


call %PACLI% LOGOFF VAULT="Vault" USER=administrator

call %PACLI% TERM