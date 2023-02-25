#/bin/bash

ssh-keygen -t ed25519
cat "Host github.com
	PreferredAuthentications publickey
	IdentitiesOnly yes
	IdentityFile ~/.ssh/github_id_ed25519
	User git" >> ~/.ssh/config
id=$(cat ~/.ssh/id_ed25519.pub)
echo "Please paste the following into github\n\n$id"


