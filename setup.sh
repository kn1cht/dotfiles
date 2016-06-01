#!/bin/bash

DOT_FILES=(.bashrc .bash_profile .vimrc)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/Documents/git/dotfiles/$file $HOME/$file
done
