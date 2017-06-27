# -------------------------------------
# antigen
# -------------------------------------
source ~/dotfiles/.zshrc.antigen

# -------------------------------------
# パス
# -------------------------------------

export DEFAULT_USER="shu"

# 重複する要素を自動的に削除
typeset -U path cdpath fpath manpath


export PATH="/Users/shu/bin:/usr/local/bin:/usr/local/sbin:/bin:/usr/bin:/sbin:/usr/sbin:/Users/shu/.nvm/v0.11.14/bin:/opt/X11/bin:/usr/texbin:/usr/local/heroku/bin:/usr/local/Cellar/nmap/6.47/bin:usr/local/lib:/usr/local/opt/openssl/include/openssl:/Applications/MAMP/Library/bin:/Library/TeX/texbin:/usr/local/Cellar/tomcat@8.0/8.0.41/libexec/bin:/Users/shu/Downloads/RTA/bin:/Users/shu/go/bin"

export JAVA_OPTS='-Dfile.encoding=UTF-8'
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_72.jdk/Contents/Home/'
export CATALINA_HOME=/usr/local/Cellar/tomcat@8.0/8.0.43/libexec

export FZF_DEFAULT_OPTS="--ansi --select-1 --exit-0 --multi --tac"

export PYTHONPATH=/Users/shu/workspace/Caffe/python:$PYTHONPATH
export DYLD_FALLBACK_LIBRARY_PATH=/usr/local/cuda/lib:$HOME/.pyenv/versions/anaconda-2.0.1/lib:/usr/local/lib:/usr/lib

export GOPATH=$HOME/go

# -------------------------------------
# 環境変数
# -------------------------------------

# 文字コード指定
export LANG=ja_JP.UTF-8

# ページャ
export PAGER=/usr/local/bin/vimpager
export MANPAGER=/usr/local/bin/vimpager


# -------------------------------------
# zshのオプション
# -------------------------------------
# ls

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
setopt no_tify

## 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups


# -------------------------------------
# エイリアス
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
alias zshconf="vim ~/dotfiles/.zshrc"
alias vimconf="vim ~/dotfiles/.vimrc"
alias sshconf="vim ~/.ssh/config"

# -n 行数表示, -I バイナリファイル無視, svn関係のファイルを無視
alias grep="grep --color -n -I --exclude='*.svn-*' --exclude='entries' --exclude='*/cache/*'"

eval "$(rbenv init -)"

# -------------------------------------
# キーバインド
# -------------------------------------


# -------------------------------------
# その他
# -------------------------------------

# cdしたあとで、自動的に ls する
function chpwd() { ls }

# The next line updates PATH for the Google Cloud SDK.
source "$HOME/google-cloud-sdk/path.zsh.inc"

# The next line enables shell command completion for gcloud.
source "$HOME/google-cloud-sdk/completion.zsh.inc"

alias rta="$HOME/Downloads/RTA/bin/rta"
