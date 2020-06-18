echo off

net user "azertuiop" "Bla&12345678" /add /active:yes
wmic useraccount WHERE Name='azertuiop' set PasswordExpires=false
wmic useraccount WHERE Name='azertuiop' set PasswordChangeable=false

pause