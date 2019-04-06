# -------------------------------------
# zplug
# -------------------------------------

export ZPLUG_HOME=$HOME/.zplug
source $ZPLUG_HOME/init.zsh

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
zplug "themes/candy-modified", from:oh-my-zsh, as:theme

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

export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/sbin:/usr/bin:/sbin:/bin"

export ANYENV_DEFINITION_ROOT=$HOME/.anyenv/anyenv-install
eval "$(anyenv init -)"

export XDG_CONFIG_HOME=$HOME/dotfiles

export HOMEBREW_INSTALL_CLEANUP=1

export JAVA_OPTS='-Dfile.encoding=UTF-8'
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

export FZF_DEFAULT_OPTS="--ansi --select-1 --exit-0 --multi  --reverse"

export GOPATH=$HOME
export GOBIN=$GOPATH/bin

# -------------------------------------
# Environment Variables
# -------------------------------------

export LANG=en_US.UTF-8

# -------------------------------------
# zsh options
# -------------------------------------

export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=32' 'ex=31'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=2

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
# exit
alias q="exit"

# ls color
case "${OSTYPE}" in
  darwin*)
    alias ls="ls -aG"
    alias ll="ls -lG"
    alias la="ls -alG"
    ;;
  linux*)
   alias ls='ls -a --color'
   alias ll='ls -l --color'
   alias la='ls -la --color'
   ;;
esac
alias lsg="ls | grep "

# vim
alias vi="nvim"
alias vim="nvim"

# postgresql起動
alias psqlstart="postgres -D /usr/local/var/postgres"

# コンフィグ編集
alias zshconf="vim ~/.zshrc"
alias zshmine="vim ~/.zshrc.mine"
alias vimconf="vim ~/dotfiles/nvim"
alias sshconf="vim ~/.ssh/config"

# -n 行数表示, -I バイナリファイル無視, svn関係のファイルを無視
alias grep="grep --color -n -I --exclude='*.svn-*' --exclude='entries' --exclude='*/cache/*'"

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
# をfzfに変更
function select_history() {
#   export LC_CTYPE=C
#  local tac_cmd
#  which gtac &> /dev/null && tac_cmd=gtac || tac_cmd=tac
#  BUFFER=$($tac_cmd ~/.zsh_history | sed 's/^: [0-9]*:[0-9]*;//' \
#    | fzf --query "$LBUFFER")
#  CURSOR=$#BUFFER         # move cursor
#  zle -R -c               # refresh
#  export LC_CTYPE=ja_JP.UTF-8

  local tac=${commands[tac]:-"tail -r"}
  BUFFER=$( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | sed 's/ *[0-9]* *//' | eval $tac | awk '!a[$0]++' | fzf +s)
  CURSOR=$#BUFFER
  zle clear-screen

}
zle -N select_history
bindkey '^R' select_history

function peco_src() {
  local src_dir=$(ghq list --full-path | fzf --query "$LBUFFER")
  if [ -n "$src_dir" ]; then
      BUFFER="cd $src_dir"
      zle accept-line
  fi
  # zle clean-screen
  zle -R -c               # refresh
}
zle -N peco_src
# bindkey '^S' peco_srcがなぜか効かないので
bindkey '^]' peco_src


# -------------------------------------
# Others
# -------------------------------------

# "ls" after "cd" automatically
function chpwd() { ls }

source ~/.zshrc.mine
