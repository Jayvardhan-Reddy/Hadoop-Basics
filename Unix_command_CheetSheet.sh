#Grep

  grep 'UNIX' file1  Search for the given string in a single file
  grep 'UNIX' file*  Multiple files.
  grep -r 'UNIX' *  Recursively
  grep -i 'is' file  Ignore Case
  grep -wi 'is' file  Whole words
  grep -A 3 'Error' Logfile.txt After match
  grep -B 3 'Error' Logfile.txt Before the match
  grep -C 3 'Error' Logfile.txt Around the match
  grep -iv 'Ora' File1  Not matched
  grep -ci 'ORA' file1  Count
  grep -n 'ORA' file1  Line Number
  grep '^[0-9].*' file1  regular expression pattern
  grep 'long$' file1  End of a line
  grep '^Ora'  file1  Start of a line
  grep -l 'unix' *  File names
  grep -L  'unix' *  not contain the pattern.

  egrep 'SQL|PLSQL|UNIX' file Multiple matching 
  fgrep 'Long$' List  Format Matching 

#Find

  find -name 'emp.txt'  Matching File pattern
  find -iname 'emp.txt'  Ignoring the case.
  find -iname 'file*'  Multiple Files
  find -type d  -iname 'file*' Folder only
  find -empty  Empty Files and Folder
  find -empty -type f  Empty File only
  find -name 'File*'  
  find /root/oracle -name 'File*' specific directory
  find -not -iname 'File*' find the files whose name are not
  find . -size 6k  Size Based Search
  find . -size +20k
  find . -mmin -20  modified within 20 minutes 
  find . -not -mtime -1  modified 1 day back.
  find . -amin -60  accessed  within 1 hour.
  find . -atime -1  accessed  within 1 day.
  find . -cmin -120  changed within 2 hours.
  find . -ctime -2  changed within 2 days
  find . -type f -name *.log -size +10M  -exec rm -rf {} \;  Find all .log files with more than 10MB and delete them

  Locate Filename  It searches that database for the filename instead of searching your filesystem

#User Management

  useradd jay  Add a New user
  passwd jay  Add a Passwword
  groupadd oracle  Add a New Group
  usermod -g oracle jay
  groupdel oracle  Delete a group
  userdel -r jay  r - It will delete the home directory as well

#Change Group to the file
  touch file
  ls -l
  groupadd orafs
  chgrp unix file
  ls -l

#Change owner to the file
  useradd jay
  chown jay file
  ls -l


#Permission Groups
  Owner (u)
  Group (g)
  Others (o)
  All user (a)

#Permission Types
 read (r) - 4
 write (w) - 2
 execute (x) - 1

#Permission symbols
  Additional permissions(+)
  Revoke the permissions(-)
  Specific permissions(=)

  touch file
  ls -l
  chmod u+x file  Add single permission 
  chmod u+x,g+x file  Add multiple permission 
  chmod u-rx,o-r file  Remove permission 
  chmod a+x file  Change permission for all 
  chmod u=r file  Give only read permissions 
  chmod 777 file   Give all permissions 
  chmod 000 file   Remove all permissions
  umask 
User creation mask and  Sets default permissions for a newly created file and directory.

  touch file
  umask 022
  touch file1
  ls -l

  umask value is 022
  New File Permissions 644 (666 - 022). 
  New Directories Permissions 755 (777 - 022)
