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

#Sed Pattern Matching 
  -i = option edit the file itself inplace
  -e script, --expression = script

  To delete first line in a file
    sed '1d' file.txt > tmpfile; mv tmpfile file.txt  (Time 14s)
    (or)
    sed -i '1d' d.txt (Time 20s)
    (or)
    tail -n +2 d.txt > r2.txt (Time 88s)
    
  To delete last line in a file
    sed -i '$d' <file>
    (or)
    cp foo.txt foo.txt.tmp
    sed '$d' foot.txt.tmp > foo.txt
    rm -f foo.txt.tmp
    
  For Big files, fastest way
    head -n -1 foo.txt > temp.txt; mv temp.txt foo.txt
    
  If you want to delete the Top line use this
    tail -n+2 foo.txt #which means lines starting at line 2
    
  Most Efficient way (To remove last line from a file without reading the whole file or rewriting anything)
    tail -n 1 "$file" | wc -c | xargs -I {} truncate "$file" -s -{}
    
  To print it on standard output
    tail -n 1 "$file" | tee > (wc -c | xargs -I {} truncate "$file" -s -{})
  
  To delete first n lines
    $sed -e '1,3d' < t.txt
    
  To delete First & last line
    $sed -i '1d;$d' filename
    
  To delete every line that begins with KU
    $sed /^KU > /d
    
  To delete lines other than last line or footer line
    $sed '$!d' file
    
  To delete empty lines or blank line    
    $sed '/^$/d' file

  #Based on Pattern Match
  Delete lines that begin with specified characters
    $sed '/^u/d' file
    
  Delete lines which are in uppercase or capital letters
    $sed '/^[A-Z]*$/d' file
    
  Delete lines starting from a Pattern till the last line
    $sed '/fedora/,$d' file
    
  Delete ;ast line only if it contains the pattern
    $sed '${/ubuntu/d;}' file
    
  #Replacing or Substituing    
  
  Replacing a string or substring
    $sed 's/unix/linux/' file.txt
    
  Replacing the nth occurance of a pattern in a line
    $sed 's/unix/linux/2' file.txt
    
  Replacing all the occurance of the pattern in a file/line
    $sed 's/unix/linux/g' file.txt
    
  Replacing from nth occurance to all occurances in a line
    $sed 's/unix/linux/3g' file.txt
    
  Replacing string on a range of lines
    $sed '1,3 s/unix/linux/' file.txt
    
  Replace on a lines which matches a pattern
    $sed '/linux/ s/unix/centos/' file.txt  # Here sed command first looks for the lines which has the pattern "linux" and then replaces the word "unix" with "centos".

  Add a line after a Match [a = after , i = before]
    $sed '/unix/ a "Add a new line"' file.txt
    
  Change a line
    $sed '/unix/ c "change line" file.txt
      
  #Environment variables in Linux or Passing Parameter
  $#    Stores the number of command-line arguments that 
        were passed to the shell program.
  $?    Stores the exit value of the last command that was 
        executed.
  $0    Stores the first word of the entered command (the 
        name of the shell program).
  $*    Stores all the arguments that were entered on the
        command line ($1 $2 ...).
  "$@"  Stores all the arguments that were entered
        on the command line, individually quoted ("$1" "$2" ...).
        
  simple example. If you run following command:

  ./command -yes -no /home/username
  $# = 3
  $* = -yes -no /home/username
  $@ = array: {"-yes", "-no", "/home/username"}
  $0 = ./command, $1 = -yes etc.
