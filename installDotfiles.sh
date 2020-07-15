#!/bin/bash
############################
# installDotfiles.sh
# This script creates symlinks in the home directory to all the dotfiles in this
# directory.
############################

########## Variables

THIS_FILE=`basename "$0"`
BACKUP_DIR=~/dotfiles_old
CURRENT_DIR_CONTENTS=`ls | grep -v '\.md'`
NEW_DOTFILES=( ${CURRENT_DIR_CONTENTS[@]/$THIS_FILE/} )

echo "Dotfiles to install:"
echo "'${NEW_DOTFILES[@]}'"
echo

# create dotfiles_old in homedir.
echo "Creating '$BACKUP_DIR' to back up existing dotfiles."
mkdir -p $BACKUP_DIR
echo

# move any existing dotfiles in homedir to dotfiles_old directory, then create
# symlinks.
echo "Backing up existing dotfiles and creating new symlinks:"
for NEW_DOTFILE in ${NEW_DOTFILES[*]}; do
  FINAL_DOTFILE_NAME=~/.$NEW_DOTFILE  # Append a '.' to the front of the file name.
  if [ -a $FINAL_DOTFILE_NAME ]; then
    mv $FINAL_DOTFILE_NAME ~/dotfiles_old/
    echo "Existing file '$FINAL_DOTFILE_NAME' backed up in: '~/dotfiles_old/'."
  fi
  ln -s $PWD/$NEW_DOTFILE $FINAL_DOTFILE_NAME
  echo "Installed dotfile: '$FINAL_DOTFILE_NAME'"
done

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  read -p "Install powerline fonts? " yn
  case $yn in
      [Yy]* ) sudo apt-get install fonts-powerline;;
      [Nn]* ) echo "";;
      * ) echo "Please answer yes or no.";;
  esac
fi

echo
read -p 'Please enter a Jira URL (zsh jira plugin) if used for this machine (default: None): ' jira_url
if [[ -z "${jira_url// }" ]]; then
  echo "Not writing a Jira URL file for the ZSH jira plugin"
else
  echo "Writing Jira URL file at ~/.jira-url"
  echo $jira_url >> ~/.jira-url
fi

# install vundle so we can install the rest of the vim plugins.
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  echo -e "\n\n ---------- Installing Vundle ----------"
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if [ ! -d ~/.tmux/plugins/tpm ]; then
  echo -e "\n\n ---------- Installing Tmux Plugin Manager ----------"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  echo
  ~/.tmux/plugins/tpm/bin/install_plugins
fi
echo
echo "Dotfile installation complete."
