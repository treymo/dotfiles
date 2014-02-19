# Aliases
alias ll='ls -al'
alias tmux="TERM=screen-256color-bce tmux" # Fix colors in tmux

# Prompt
function git_branch_name() {
  echo $(git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/(\1)/');
}
export PS1="\u@\h:\[\e[00;36m\][\w]\[\e[00;33m\] \$(git_branch_name)\[\e[0m\]\$ "

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
