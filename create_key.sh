#/bin/bash
FILE=~/.ssh/id_ed25519.pub
if [[! -f "$FILE"]]; then
  ssh-keygen -t ed25519
fi
echo -e "\nHost github.com
\tPreferredAuthentications publickey
\tIdentitiesOnly yes
\tIdentityFile ~/.ssh/id_ed25519
\tUser git\n" >> ~/.ssh/config
id=$(cat ~/.ssh/id_ed25519.pub)
echo "Please paste the following into github\n\n$id"


