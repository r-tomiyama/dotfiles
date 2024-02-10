alias pip=pip3

alias la='ls -a'
alias ll='ls -l'
alias g='git'

if which eza > /dev/null 2>&1; then
  alias ls='eza -F --icons'
else
  alias ls='ls -FGH'
fi

setopt auto_cd # ディレクトリ名だけでcdする

export EDITOR=code

source ~/.zshrc-local
