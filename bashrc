# Aliases
alias ll='ls -al'

# Visual
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

platform='unknown'
unamestr=$(uname)
if [[ "$unamestr" == 'Darwin' ]]; then
  source ~/.bashrc_osx
fi
