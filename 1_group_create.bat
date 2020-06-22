                

Set groupName=hj_ftp_group
Set groupComment=test

:: find the current group                                                                                       
net localgroup | find /i "%groupName%" > tmp
Set /P res= < tmp
Del  tmp
:: check if current group already exist
If "%res%" EQU "*%groupName%" (
Echo "Le groupe [%groupName%] existe deja. Il sera supprime et recree"
Pause 
Goto DeleteGroupAndRecreateIt
) Else (
Goto CreateGroup
)
Pause
Exit                
                                                         
:CreateGroup
net localgroup %groupName% /comment:%groupComment% /add
Echo "Le groupe [%groupName%] a ete ajoute avec succes. Operation terminee."
Pause
Exit 
                                                                                                                                                                     
:DeleteGroupAndRecreateIt
net localgroup %groupName% /Delete
Echo "Le groupe [%groupName%] a ete supprime."
Pause
Goto CreateGroup
Pause
Exit   
                                                                                   
                                                                                