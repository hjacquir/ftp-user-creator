                

Set name="azertuiop"
Set pass="Bla&12345678"  

net user %name% %pass% /add /active:yes
wmic useraccount WHERE Name='%name%' set PasswordExpires=false
wmic useraccount WHERE Name='%name%' set PasswordChangeable=false

pause