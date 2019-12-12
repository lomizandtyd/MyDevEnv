#!/usr/bin/env bash
#
# Usage: 
# Author: lomizandtyd

ROOT=`realpath ..`
DOBACKUP=true
INSTALL=true

(${DOBACKUP}) && {

[ -f ~/.vimrc ] && mkdir -p ~/.vim_backup/ && cp ~/.vimrc ~/.vim_backup/ && echo "backup .vimrc in ~/.vim_backup"
[ -d ~/.vim ] && mkdir -p ~/.vim_backup/ && cp -r ~/.vim ~/.vim_backup/ && echo "backup .vim in ~/.vim_backup"

}

(${INSTALL}) && {

sudo apt update
sudo apt install exuberant-ctags

}

cp -r ${ROOT}/vim/* ~/ && echo "done."
