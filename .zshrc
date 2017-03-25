# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/shun/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PROMPT='%F{cyan}[%~]$%f '

# plugin paths
if [ -d $HOME/plugins ]; then
  for plugins_path in $HOME/plugins/*/bin; do
    if [ -d $plugins_path ]; then
      PATH=$PATH:$plugins_path
    fi
  done
fi
export PATH=$PATH:$HOME/bin

export DOCKER_HOST=172.17.0.1:2375

if [ -f /etc/docker-env ]; then
  eval "$(cat /etc/docker-env | grep DOCKER_ | sed 's/^/export /')"
  if [ -n "$DOCKER_API_VERSION" ]; then
    export DOCKER_API_VERSION=$DOCKER_API_VERSION
  fi
fi

if [ "$(which direnv)" ]; then
  eval "$(direnv hook zsh)"
fi

export RAILS_DEVEL_NAME=$(basename $HOME)

alias vi='nvim'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -Al'
alias lA='ls -al'

alias grep='grep --color=auto'

alias s='git status-verbose'
alias a='git add -A'
alias ci='git commit -m'
alias br='git branch-and-post'
alias pub='git pub'
