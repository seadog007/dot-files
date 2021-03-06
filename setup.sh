#!/bin/bash

# Run this script by
# curl -s https://raw.githubusercontent.com/seadog007/dot-files/master/setup.sh | bash
# Download ssh auth by
# curl -s https://raw.githubusercontent.com/seadog007/dot-files/master/.ssh/authorized_keys > ~/.ssh/authorized_keys

# For fucking MacOS
[ "`git 2>&1 | grep -o xcode`" == "xcode" ] && echo "Just install git and run me again" && exit 1

rm -rf /tmp/dot-files
git clone https://github.com/seadog007/dot-files.git /tmp/dot-files

cd /tmp/dot-files
cat .ssh/config >> ~/.ssh/config
cat .ssh/authorized_keys >> ~/.ssh/authorized_keys
cp .ssh/verify.sh ~/.ssh

cp .gitconfig ~/
cp .tmux.conf ~/
[ "`basename $SHELL`" == "bash" ] && cp .bashrc ~/
[ "`uname -a | cut -d\  -f1`" == "Darwin" ] && mv ~/.bashrc ~/.bash_profile
cp .inputrc ~/

if [ "`uname -a | cut -d\  -f1`" == "Linux" ]
then
	cd
	[ -d "~/.peda" ] && cd ~/.peda && git pull
	[ ! -d "~/.peda" ] && git clone https://github.com/scwuaptx/peda.git ~/.peda && echo "source ~/.peda/peda.py" >> ~/.gdbinit
fi

cd
[ -d "~/.vim" ] && cd ~/.vim && git pull
[ ! -d "~/.vim" ] && git clone https://github.com/seadog007/dot-files-vimrc.git .vim && ln -s .vim/.vimrc

rm -rf /tmp/dot-files
