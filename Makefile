all: install

install: deps brew tools link

deps:
	curl -fLo $@ --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew:
# cask
	brew cask install java
	brew cask install xquartz
	brew cask install docker

# core
	brew install wget
	brew install zplug
	brew install vim --with-lua
	brew install zsh
	brew install zplug
	brew install coreutils
	brew install nkf
	brew install ag # the_silver_searcher
	brew install tree
	brew install fzf
	brew install direnv

# Git
	brew install git
	brew install ghq
	brew install hub
	brew install tig


# Programming
	brew install gcc
	brew install go
	brew install glide
	brew install node
	brew install rbenv
	brew install ruby-build
	brew install pyenv
	brew install haskell-stack
	brew install maven
	brew install tomcat
	brew install awscli

# Database
	brew install postgresql
	brew install sqlite
	brew install mongodb
	brew install memcached
	brew install redis

# others
	brew install ctags
	brew install wine
	brew install webp
	brew install imagemagick@6

	brew cleanup

tools:
	go get -u github.com/nsf/gocode

PWD:=$(shell pwd)
srcs:=.vimrc .vim .zshrc .zshrc.mine .tern-project .eslintrc

link:
	$(foreach src,$(srcs),ln -Fs $(PWD)/$(src) $(HOME)/$(src);)
	mkdir $(HOME)/.vimback $(HOME)/.vimtmp

