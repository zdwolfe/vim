#!/bin/bash
DIR="$( cd "$( dirname "$0" )" && pwd )"
DATE=`date +%s`

if [ -d ~/.vim ] 
then
  mv -v ~/.vim ~/.vim.$DATE
fi

if [ -d ~/.vimrc ] 
then
  mv -v ~/.vimrc ~/.vimrc.$DATE
fi

ln -sfv $DIR ~/.vim
ln -sfv $DIR/vimrc ~/.vimrc
vim +BundleInstall +qall
echo "vim config installed"
