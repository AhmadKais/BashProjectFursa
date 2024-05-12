#!/bin/bash
# use su - otheruser the "-" created a login shellll
# say hello to the user the moment a new user is reated
echo "Hello $USER"

# define an environment variable COURSE_ID using the export
export COURSE_ID=DevOpsFursa

# Check .token file permissions
# change the stat displays all the sates of the file with the inode type etc and the
#-c "%a only displays the permissions in octal
if [ -f ~/.token ]; then
    token_perm=$(stat -c "%a" ~/.token)
    if [ "$token_perm" != "600" ]; then
         echo "Warning: .token file has too open permissions"
    fi
fi

# new default umask to 006
umask 006

# Add ~/usercommands to PATH , we saw this command with alon in class
export PATH=$PATH:/home/$USER/usercommands

echo "The current date is: $(date -u +"%Y-%m-%dT%H:%M:%S%:z")"

#create a new shortcut instead of using the part  after the =  now we just use the ltxt
#for the same output
alias ltxt='ls *.txt'

# Create directory temp if it already exists then delete every thing inside it
if [ -d ~/tmp ]; then
    rm -rf ~/tmp/*
else
    mkdir ~/tmp
fi

# Kill process connected to port to port 8080
fuser -k 8080/tcp > /dev/null 2>/dev/null

#exit 0
# your solution here...
