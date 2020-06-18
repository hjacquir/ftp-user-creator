rem echo off

set groupName=hj_ftp_group
set groupComment=test

net localgroup | find /i "%groupName%" > nul && goto End

pause

net localgroup %groupName% /comment:%groupComment% /add

:End
echo "Le groupe [%groupName%] existe déjà. Opération interrompue."
exit

pause