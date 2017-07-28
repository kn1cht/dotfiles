#!/bin/bash

cd `dirname $0`

DOT_FILES=(.bashrc .bash_profile .vimrc .zshrc)

for file in ${DOT_FILES[@]}
do
    ln -s ./$file $HOME/$file
done
