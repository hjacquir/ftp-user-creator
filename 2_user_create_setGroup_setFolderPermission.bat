                

Set filePath=C:\ftp-user-creator\users_list.csv
Set groupName=hj_ftp_group
                                                                                                                                                        
for /f "usebackq tokens=1-3 delims=;" %%a in (%filePath%) do (
        :: echo %%a %%b
        :: create user
        net user %%a %%b /add /active:yes
        :: set user password never expire
        wmic useraccount WHERE Name='%%a' set PasswordExpires=false
        :: set user does not change password
        wmic useraccount WHERE Name='%%a' set PasswordChangeable=false
        Echo "utilisateur %%a cree avec succes."
        :: add user to group previously created
        net localgroup %groupName% %%a /add
        Echo "utilisateur : %%a ajoute avec succes au groupe : %groupName%."
        :: set folder permission
        :: remove all heritance
        Icacls %%c /inheritance:d /C /Q
        :: remove authenticated user permission
        icacls %%c /remove:g *S-1-5-11
        :: remove all user permission
        Icacls %%c /remove[:g] Utilisateurs
        :: add permission to read and write for current login to associated current folder
        Icacls %%c /grant "%%a:(OI)(CI)RW"
)

Pause

