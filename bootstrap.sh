#! /usr/bin/env bash

set -e
set -x

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac
echo ${machine}

ETC=~/.local/etc
BIN=~/.local/bin
mkdir -p $ETC
mkdir -p $BIN

# git clone respository
cd ~/.local/
if [ -d config ]; then
    cd config
    git pull
else
	git clone git@github.com:trimagiccube/my_bash_config.git
	cd my_bash_config
fi

cp -rf etc/* $ETC/
cp -rf bin/* $BIN/
cp bootstrap.sh $BIN/

# source init.sh
sed -i "\:$ETC/init.sh:d" ~/.bashrc
echo ". $ETC/init.sh" >> ~/.bashrc
. ~/.bashrc

:<<EOF
# source vimrc.vim
touch ~/.vimrc
sed -i "\:$ETC/vimrc.vim:d" ~/.vimrc
echo "source $ETC/vimrc.vim" >> ~/.vimrc

# source tmux.conf
touch ~/.tmux.conf
sed -i "\:$ETC/tmux.conf:d" ~/.tmux.conf
echo "source $ETC/tmux.conf" >> ~/.tmux.conf
EOF
