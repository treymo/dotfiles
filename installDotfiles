#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/.dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc bashrc_osx gitconfig gitignore tmux.conf vimrc "    # list of files/folders to symlink in homedir

##########

# TODO: get rid of all the error messages if there is nothing to backup.

# create dotfiles_old in homedir.
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory.
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create
# symlinks.
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    if [ -f $file ]
      then
        echo "Moving ~/.$file to ~/dotfiles_old/."
        mv ~/.$file ~/dotfiles_old/
    fi
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# install vundle so we can install the rest of the vim plugins.
echo "\n\n ---------- Installing Vundle ----------
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

