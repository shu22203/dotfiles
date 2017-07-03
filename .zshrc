# -------------------------------------
# zplug
# -------------------------------------
source ~/.zplug/init.zsh
#compile if .zwc is old
if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
  echo "zcompile .zshrc"
  zcompile ~/.zshrc
fi
if [ ~/.zshenv -nt ~/.zshenv.zwc ]; then
  echo "zcompile .zshenv"
  zcompile ~/.zshenv
fi

zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "b4b4r07/enhancd", use:init.sh
zplug "erikw/tmux-powerline"
zplug "greymd/tmux-xpanes"
zplug "themes/candy", from:oh-my-zsh, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install(zplug)? [y/N]: "
  if  read -q; then
    echo; zplug install
  fi
fi

zplug load

# -------------------------------------
# Path
# -------------------------------------

export DEFAULT_USER="shu"

# 重複する要素を自動的に削除
typeset -U path cdpath fpath manpath

export PATH="/Users/shu/bin:/usr/local/bin:/usr/local/sbin:/bin:/usr/bin:/sbin:/usr/sbin:/Users/shu/.nvm/v0.11.14/bin:/opt/X11/bin:/usr/texbin:/usr/local/heroku/bin:/usr/local/Cellar/nmap/6.47/bin:usr/local/lib:/usr/local/opt/openssl/include/openssl:/Applications/MAMP/Library/bin:/Library/TeX/texbin:/usr/local/Cellar/tomcat@8.0/8.0.41/libexec/bin:/Users/shu/Downloads/RTA/bin:/Users/shu/go/bin"

export JAVA_OPTS='-Dfile.encoding=UTF-8'
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_72.jdk/Contents/Home/'
export CATALINA_HOME=/usr/local/Cellar/tomcat@8.0/8.0.43/libexec

export FZF_DEFAULT_OPTS="--ansi --select-1 --exit-0 --multi"

export PYTHONPATH=/Users/shu/workspace/Caffe/python:$PYTHONPATH
export DYLD_FALLBACK_LIBRARY_PATH=/usr/local/cuda/lib:$HOME/.pyenv/versions/anaconda-2.0.1/lib:/usr/local/lib:/usr/lib

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin

# -------------------------------------
# Environment Variables
# -------------------------------------

export LANG=ja_JP.UTF-8

export PAGER=/usr/local/bin/vimpager
export MANPAGER=/usr/local/bin/vimpager

# -------------------------------------
# zsh options
# -------------------------------------

# export LSCOLORS=Cxfxcxdxbxegedabagacad
# export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# zstyle ':completion:*' list-colors 'di=32' 'ex=31'

## 補完機能の強化
autoload -U compinit
compinit

## 入力しているコマンド名が間違っている場合にもしかして：を出す。
setopt correct

# ビープを鳴らさない
setopt nobeep

## ^Dでログアウトしない。
setopt ignoreeof

## バックグラウンドジョブが終了したらすぐに知らせる。
setopt notify

## タブによるファイルの順番切り替えをする
setopt auto_menu

## ディレクトリ名を入力するだけでcdできるようにする
setopt auto_cd

## Command history configuration
HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

# -------------------------------------
# Alias
# -------------------------------------

# core
# alias ls='gls --color=auto'
alias ls="ls -GA"
alias lsg="ls | grep "

# vim
alias vi="vim"

# postgresql起動
alias psqlstart="postgres -D /usr/local/var/postgres"

# コンフィグ編集
alias zshconf="vim ~/.zshrc"
alias vimconf="vim ~/.vimrc"
alias sshconf="vim ~/.ssh/config"

# -n 行数表示, -I バイナリファイル無視, svn関係のファイルを無視
alias grep="grep --color -n -I --exclude='*.svn-*' --exclude='entries' --exclude='*/cache/*'"

eval "$(rbenv init -)"

# -------------------------------------
# Key Binds
# -------------------------------------

# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# zshで特定のコマンドをヒストリに追加しない条件を柔軟に設定する - mollifier delta blog
# http://mollifier.hatenablog.com/entry/20090728/p1
zshaddhistory() {
    local line=${1%%$'\n'}
    local cmd=${line%% *}

    # 以下の条件をすべて満たすものだけをヒストリに追加する
    [[ ${#line} -ge 4
        && ${cmd} != (m|man)
    ]]
}

# http://d.hatena.ne.jp/kbkbkbkb1/20120429/1335835500
function peco_select_history() {
  export LC_CTYPE=C
  local tac_cmd
  which gtac &> /dev/null && tac_cmd=gtac || tac_cmd=tac
  BUFFER=$($tac_cmd ~/.zsh_history | sed 's/^: [0-9]*:[0-9]*;//' \
    | fzf --query "$LBUFFER")
  CURSOR=$#BUFFER         # move cursor
  zle -R -c               # refresh
  export LC_CTYPE=ja_JP.UTF-8
}
zle -N peco_select_history
bindkey '^R' peco_select_history

function peco_src() {
  local src_dir=$(ghq list --full-path | peco --query "$LBUFFER")
  if [ -n "$src_dir" ]; then
      BUFFER="cd $src_dir"
      zle accept-line
  fi
  # zle clean-screen
  zle -R -c               # refresh
}
zle -N peco_src
bindkey '^S' peco_src

# -------------------------------------
# Others
# -------------------------------------

# "ls" after "cd" automatically
function chpwd() { ls }

# The next line updates PATH for the Google Cloud SDK.
source "$HOME/google-cloud-sdk/path.zsh.inc"

# The next line enables shell command completion for gcloud.
source "$HOME/google-cloud-sdk/completion.zsh.inc"

alias rta="$HOME/Downloads/RTA/bin/rta"

#関数定義(引数3つ)
tab-color() {
    echo -ne "\033]6;1;bg;red;brightness;$1\a"
    echo -ne "\033]6;1;bg;green;brightness;$2\a"
    echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}
