all: install

install: deps brew tools link

deps:
	curl -fLo $@ --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew:
# core
	brew install wget
	brew install zplug
	brew install vim --with-lua
	brew install zsh
	brew install tmux
	brew install hub
	brew install tree
	brew install fzf
	brew install ghq

# Git
	brew install git
	brew install hub
	brew install tig


# Language
	brew install gcc
	brew install go

	brew cleanup

tools:
	go get -u github.com/nsf/gocode

PWD:=$(shell pwd)
srcs:=.vimrc .vim .zshrc .zshrc.mine tmux.conf

link:
	$(foreach src,$(srcs),ln -Fs $(PWD)/$(src) $(HOME)/$(src);)

