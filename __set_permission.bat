                                                                                                                                                

Set filePath=C:\ftp-user-creator\users_list.csv
                                                                                                                                                        
for /f "usebackq tokens=1-3 delims=;" %%a in (%filePath%) do (
:: remove inheritance
Icacls %%c /inheritance:d /C /Q
:: remove authenticated users
icacls %%c /remove:g *S-1-5-11
:: remove all users
Icacls %%c /remove[:g] Utilisateurs
:: add permission for current login to specific folder
Icacls %%c /grant "%%a:(OI)(CI)RW"
)

Pause

