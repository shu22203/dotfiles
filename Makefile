all: install

install: deps brew tools link

deps:
	curl -fLo $@ --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew:
# cask
	brew cask install docker
	brew cask install google-cloud-sdk

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
	brew install awscli

	brew cleanup

tools:
	go get -u golang.org/x/tools/cmd/gopls

PWD:=$(shell pwd)
srcs:=.vimrc .ideavimrc .vim .zshrc .zshrc.mine .tigrc .latexmkrc .gitconfig .gitignore_global

link:
	$(foreach src,$(srcs),ln -Fs $(PWD)/$(src) $(HOME)/$(src);)
	ln -Fs $(PWD)/nvim/coc ~/.config/coc
	mkdir $(HOME)/.vimback $(HOME)/.vimtmp

