                                                                                                                        

Set filePath=C:\Users\hjacquir\Documents\workspace\ftp-user-creator\users_list.csv
                                                                                                                                                        
for /f "usebackq tokens=1-2 delims=;" %%a in (%filePath%) do (
        echo %%a %%b
        net user %%a %%b /add /active:yes
        wmic useraccount WHERE Name='%%a' set PasswordExpires=false
        wmic useraccount WHERE Name='%%a' set PasswordChangeable=false
        Echo "utilisateur %%a ajoute avec succes."
)

Pause

