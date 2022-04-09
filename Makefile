all: install

install: deps brew tools link

deps:
	curl -fLo $@ --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew:
# cask
	brew install --cask google-cloud-sdk

# core
	brew install wget
	brew install neovim
	brew install coreutils
	brew install nkf
	brew install tree
	brew install fzf
	brew install asdf
	brew install direnv
	brew install ripgrep
	brew install jq
	brew install bat
	brew install fd
	brew install lsd
	brew install diff-so-fancy
	brew install tldr

# Git
	brew install git
	brew install ghq
	brew install gh
	brew install tig

# Programming
	brew install awscli

	brew tap beeftornado/rmtree && brew install beeftornado/rmtree/brew-rmtree

	brew cleanup

tools:
	go get -u golang.org/x/tools/cmd/gopls

PWD:=$(shell pwd)
srcs:=.vimrc .ideavimrc .vim .zshrc .zshrc.mine .tigrc .latexmkrc .gitconfig .gitignore_global

link:
	$(foreach src,$(srcs),ln -Fs $(PWD)/$(src) $(HOME)/$(src);)
	ln -Fs $(PWD)/nvim/coc ~/.config/coc
	mkdir $(HOME)/.vimback $(HOME)/.vimtmp

