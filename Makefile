all: install

install: deps brew tools link

deps:
	curl -fLo $@ --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew:
# cask
	brew cask install docker

# core
	brew install wget
	brew install zplug
	brew install zsh
	brew install neovim
	brew install coreutils
	brew install nkf
	brew install tree
	brew install fzf
	brew install direnv
	brew install ripgrep
	brew install jq

# Git
	brew install git
	brew install ghq
	brew install hub
	brew install tig

# Programming
  brew install anyenv
	brew install gcc
	brew install glide
	brew install haskell-stack
	brew install scala
	brew install sbt
	brew install maven
	brew install awscli
	brew install protobuf

# Database
	brew install mysql
	brew install postgresql
	brew install sqlite
	brew install mongodb
	brew install memcached
	brew install redis
	brew install cassandra
	brew install leveldb

# others
	brew install ctags
	brew install imagemagick@6

	brew cleanup

tools:
	go get -u github.com/nsf/gocode

PWD:=$(shell pwd)
srcs:=.vimrc .vim .zshrc .zshrc.mine .tern-project .eslintrc .tigrc

link:
	$(foreach src,$(srcs),ln -Fs $(PWD)/$(src) $(HOME)/$(src);)
	mkdir $(HOME)/.vimback $(HOME)/.vimtmp

