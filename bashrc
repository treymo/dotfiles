source ~/.git-completion.bash
alias gco='git co'
alias gci='git ci'
alias grb='git rb'

# Path
export PATH=$PATH:/usr/local/opt/ruby/bin
export PATH=/usr/local/bin:$PATH

# Aliases
alias ll='ls -al'

# Visual
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Auto Completion
if [ -f `brew --prefix`/etc/bash_completion.d/rails.bash ]; then
  source `brew --prefix`/etc/bash_completion.d/rails.bash
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
