# Aliases
alias ls='ls --color=auto'
alias ll='ls -al --color=auto'
alias tmux='tmux -2' # 256 colors in tmux

#Colors
export TERM=screen-256color

# Prompt
function git_branch_name() {
  echo $(git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/(\1)/');
}
export PS1="\u@\h:\[\e[00;36m\][\w]\[\e[00;33m\] \$(git_branch_name)\[\e[0m\]\$ "

# Source the OSX settings if needed.
unamestr=$(uname)
if [[ "$unamestr" == 'Darwin' ]]; then
  source ~/.bashrc_osx
fi
export PATH=$HOME/local/bin:$PATH

# ----- Env Variables -----

# Virtualenv wrapper
export WORKON_HOME=~/.ve
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.4

# -------------------------

# Add to path
export PATH=$PATH:$GRADLE_HOME/bin
