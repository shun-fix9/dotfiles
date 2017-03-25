source ~/.zplug/init.zsh
zplug 'zsh-users/zsh-completions'
zplug check || zplug install

zplug load

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd
unsetopt beep
bindkey -v

autoload -Uz compinit
compinit -C

### 補完侯補をメニューから選択する。
### select=2: 補完候補を一覧から選択する。補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=2
### 補完候補がなければより曖昧に候補を探す。
### m:{a-z}={A-Z}: 小文字を大文字に変えたものでも補完する。
### r:|[._-]=*: 「.」「_」「-」の前にワイルドカード「*」があるものとして補完する。
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#zstyle ':completion:*' keep-prefix
zstyle ':completion:*' recent-dirs-insert both

### 補完候補
### _oldlist 前回の補完結果を再利用する。
### _complete: 補完する。
### _match: globを展開しないで候補の一覧から補完する。
### _history: ヒストリのコマンドも補完候補とする。
### _ignored: 補完候補にださないと指定したものも補完候補とする。
### _approximate: 似ている補完候補も補完候補とする。
### _prefix: カーソル以降を無視してカーソル位置までで補完する。
zstyle ':completion:*' completer _oldlist _complete _match _history _ignored _approximate _prefix
#zstyle ':completion:*' completer _complete _ignored

## 補完候補をキャッシュする。
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path ~/.zsh/cache
## 詳細な情報を使わない
zstyle ':completion:*' verbose no

PROMPT='%F{cyan}[%~]$%f '

setopt no_beep
setopt hist_ignore_dups   # 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_all_dups  # 重複したヒストリは追加しない
setopt hist_reduce_blanks
setopt hist_no_store
setopt hist_verify
setopt share_history  # シェルのプロセスごとに履歴を共有
setopt extended_history  # 履歴ファイルに時刻を記録
setopt append_history  # 複数の zsh を同時に使う時など history ファイルに上書きせず追加
setopt auto_list  # 補完候補が複数ある時に、一覧表示
setopt auto_menu  # 補完候補が複数あるときに自動的に一覧表示する
setopt no_flow_control
setopt print_eight_bit
setopt complete_in_word  # カーソル位置で補完する。
setopt glob
setopt glob_complete  # globを展開しないで候補の一覧から補完する。
setopt extended_glob  # 拡張globを有効にする。
setopt mark_dirs   # globでパスを生成したときに、パスがディレクトリだったら最後に「/」をつける。
setopt numeric_glob_sort  # 辞書順ではなく数字順に並べる。
setopt magic_equal_subst  # コマンドライン引数の --prefix=/usr とか=以降でも補完
setopt always_last_prompt  # 無駄なスクロールを避ける

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
