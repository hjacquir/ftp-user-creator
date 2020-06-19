                                                                                                                                                

Set filePath=C:\ftp-user-creator\users_list.csv
:: Set groupName=hj_ftp_group
                                                                                                                                                        
for /f "usebackq tokens=1-3 delims=;" %%a in (%filePath%) do (
Icacls %%c /inheritance:d /C /Q
icacls %%c /remove:g *S-1-5-11
Icacls %%c /remove[:g] Utilisateurs
Icacls %%c /grant "%%a:(OI)(CI)RW"
)

Pause

