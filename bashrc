# Aliases
alias ls='ls --color=auto'
alias ll='ls -al --color=auto'
alias tmux='tmux -2' # 256 colors in tmux
alias weather='curl wttr.in'

#Colors
export TERM=screen-256color

# Source the OSX settings if needed.
unamestr=$(uname)
if [[ "$unamestr" == 'Darwin' ]]; then
  source ~/.bashrc_osx
fi

# ----- Modify PATH -----

# pip installs to the ~/.local/bin directory.
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/local/bin:$PATH

# ----- Env Variables -----

# Node JS
export PATH=/usr/local/lib/nodejs/node-v10.16.3-linux-x64/bin:$PATH

# Virtualenv wrapper
export WORKON_HOME=~/.ve
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.4

# Disable Ctrl + S
stty -ixon
