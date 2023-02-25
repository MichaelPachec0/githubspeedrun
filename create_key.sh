#!/bin/bash
FILE="~/.ssh/id_ed25519"
if [[ ! -a "$FILE" ]]
then
  ssh-keygen -q -t ed25519 -f ~/.ssh/id_ed25519 -P ""
fi
echo -e "\nHost github.com
\tPreferredAuthentications publickey
\tIdentitiesOnly yes
\tIdentityFile ~/.ssh/id_ed25519
\tUser git\n" >> ~/.ssh/config
id=$(cat ~/.ssh/id_ed25519.pub)
echo -e "Please paste the following into github\n\n$id"


