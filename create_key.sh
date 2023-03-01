#!/bin/bash
FILE="$HOME/.ssh/id_ed25519"

# check if both priv and pub keys are in .ssh folder
if [[ ! -f "$FILE" && ! -f "$FILE.pub" ]];  then
  ssh-keygen -q -t ed25519 -f $FILE -N ""
fi

id=$(cat ~/.ssh/id_ed25519.pub)
msg="Please paste the following into github\n\n$id"

UNAME=$(command -v uname)
UNAME_OUT=$($UNAME -s)

DATA="\nHost github.com
\tPreferredAuthentications publickey
\tIdentitiesOnly yes
\tIdentityFile ~/.ssh/id_ed25519"

if [[ $UNAME_OUT = "Darwin" ]]; then
  echo "Hello Mac!"
  echo $DATA >> ~/.ssh/config
  echo $msg
elif [[ $UNAME_OUT = "Linux" ]]; then 
  echo "Hello Linux!"
  echo -e $DATA >> ~/.ssh/config
  echo -e $msg
else
  echo "IDK WHAT WE HAVE $UNAME_OUT, assume POSIX"
  echo $DATA >> ~/.ssh/config
  echo $msg
fi

