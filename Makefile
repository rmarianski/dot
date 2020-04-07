SYMS = \
.gitconfig \
.gitignore \
.screenrc \
.tmux.conf \
.vimrc \
.zshrc \
.zshrc.local \

DIRS = \
.emacs.d \
.vim/autoload \
.vim/bundle \

DEST_SYM = $(patsubst %,~/%,$(SYMS))
DEST_DIR = $(patsubst %,~/%,$(DIRS))

VIM_PLUGINS = \
ctrlp.vim \
syntastic \
tabular \
ultisnips \
vim-colors-solarized \
vim-commentary \
vim-fugitive \
vim-go \
vim-repeat \
vim-rhubarb \
vim-snippets \
vim-surround \
vim-unimpaired \

VIM_PLUGIN_DEST = $(patsubst %,~/.vim/bundle/%,$(VIM_PLUGINS))

all: vim git tmux zsh
vim: ~/.vimrc ~/.vim/bundle ~/.vim/autoload/pathogen.vim ~/.vim/my-snippets $(VIM_PLUGIN_DEST)
emacs: ~/.emacs.d ~/.emacs.d/init.el
git: ~/.gitconfig ~/.gitignore
screen: ~/.screenrc
tmux: ~/.tmux.conf
zsh: ~/.zshrc ~/.zshrc.local
emacs-gtk-key-bindings:
	gsettings set org.gnome.desktop.interface gtk-key-theme "Emacs"
.PHONY: all vim emacs git screen tmux zsh emacs-gtk-key-bindings

$(DEST_SYM):
	ln -s `pwd`/$(notdir $@) $@

~/.emacs.d/init.el: | ~/.emacs.d
	ln -s `pwd`/.emacs.d-init.el $@

$(DEST_DIR):
	mkdir -p $@

~/.vim/autoload/pathogen.vim: ~/.vim/autoload
	curl -SsLo ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

~/.vim/bundle/syntastic: | ~/.vim/bundle
	git clone https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic

~/.vim/bundle/ultisnips: | ~/.vim/bundle
	git clone https://github.com/SirVer/ultisnips ~/.vim/bundle/ultisnips

~/.vim/bundle/ctrlp.vim: | ~/.vim/bundle
	git clone https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim

~/.vim/bundle/vim-fugitive: | ~/.vim/bundle
	git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive

~/.vim/bundle/vim-go: | ~/.vim/bundle
	git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go

~/.vim/bundle/vim-commentary: | ~/.vim/bundle
	git clone git://github.com/tpope/vim-commentary.git ~/.vim/bundle/vim-commentary

~/.vim/bundle/tabular: | ~/.vim/bundle
	git clone git://github.com/godlygeek/tabular.git ~/.vim/bundle/tabular

~/.vim/bundle/vim-colors-solarized: | ~/.vim/bundle
	git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized

~/.vim/bundle/vim-snippets: | ~/.vim/bundle
	git clone https://github.com/honza/vim-snippets ~/.vim/bundle/vim-snippets

~/.vim/bundle/vim-surround: | ~/.vim/bundle
	git clone git://github.com/tpope/vim-surround.git ~/.vim/bundle/vim-surround

~/.vim/bundle/vim-repeat: | ~/.vim/bundle
	git clone git://github.com/tpope/vim-repeat.git ~/.vim/bundle/vim-repeat

~/.vim/bundle/vim-rhubarb: | ~/.vim/bundle
	git clone https://github.com/tpope/vim-rhubarb.git ~/.vim/bundle/vim-rhubarb

~/.vim/bundle/vim-unimpaired: | ~/.vim/bundle
	git clone https://github.com/tpope/vim-unimpaired.git ~/.vim/bundle/vim-unimpaired

~/.vim/my-snippets: | ~/.vim
	ln -s $(PWD)/vim-snippets ~/.vim/my-snippets
