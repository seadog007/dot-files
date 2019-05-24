#!/bin/bash

# Run this script by
# curl https://raw.githubusercontent.com/seadog007/dot-files/master/setup.sh | bash

git clone https://github.com/seadog007/dot-files.git /tmp/dot-files

cd /tmp/dot-files
cp .ssh/config >> ~/.ssh/config
cat .ssh/authorized_keys >> ~/.ssh/authorized_keys
cp .gitconfig ~/
cp .tmux.conf ~/
[ "`basename $SHELL`" == "bash" ] && cp .bashrc ~/
cp .inputrc ~/

if [ "`uname -a | cut -d\  -f1`" == "Linux" ]
then
	cd
	[ -d "~/.peda" ] && cd ~/.peda && git pull
	[ ! -d "~/.peda" ] && git clone https://github.com/scwuaptx/peda.git ~/.peda && echo "source ~/.peda/peda.py" >> ~/.gdbinit
fi

cd
[ -d "~/.vim" ] && cd ~/.vim && git pull
[ ! -d "~/.vim" ] && git clone https://github.com/seadog007/dot-files-vim.git .vim && ln -s .vim/.vimrc

rm -rf /tmp/dot-files
