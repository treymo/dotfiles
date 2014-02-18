# Aliases
alias ll='ls -al'
alias tmux="TERM=screen-256color-bce tmux" # Fix colors in tmux

# Visual
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

platform='unknown'
unamestr=$(uname)
if [[ "$unamestr" == 'Darwin' ]]; then
  source ~/.bashrc_osx
fi
export PATH=$HOME/local/bin:$PATH
