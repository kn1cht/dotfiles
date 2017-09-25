#!/bin/bash

cd dirname $0
ABSDIR=`pwd`

DOT_FILES=(.bashrc .vimrc .zshrc)

for file in ${DOT_FILES[@]}
do
    ln -s $ABSDIR/$file $HOME/$file
done
