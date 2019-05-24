#!/bin/bash

git clone https://github.com/seadog007/dot-files.git

cd dot-files
cp .ssh/config >> ~/.ssh/config
cat .ssh/authorized_keys >> ~/.ssh/authorized_keys
cp .gitconfig ~/
cp .tmux.conf ~/
cp .bashrc ~/
cp .inputrc ~/

git clone https://github.com/scwuaptx/peda.git ~/.peda && echo "source ~/.peda/peda.py" >> ~/.gdbinit

cd
rm -rf .vim .vimrc
git clone https://github.com/seadog007/dot-files-vim.git .vim && ln -s .vim/.vimrc
