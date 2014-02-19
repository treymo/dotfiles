# Aliases
alias ll='ls -al'
alias tmux="TERM=screen-256color-bce tmux" # Fix colors in tmux

# Prompt
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}
export PS1="\[\e[00;32m\]\u\[\e[0m\]\[\e[00;37m\]@\h:\[\e[0m\]\[\e[00;36m\][\w]\[\e[0m\]\[\e[00;37m\] $(parse_git_branch)\$ "

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
