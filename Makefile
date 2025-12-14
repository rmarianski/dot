SYMS = \
.gitconfig \
.gitignore \
.screenrc \
.tmux.conf \
.vimrc \
.zshrc \
.zsh_abk \
.zsh_aliases_git \
.zsh_aliases_kubernetes \
.zsh_aliases_misc \
.config/kak/kakrc \
.ripgreprc \
.config/starship.toml

DIRS = \
.emacs.d \
.vim/autoload \
.vim/bundle \
bin \
.config/kak \
.config/nvim \
.config/snippet

DEST_SYM = $(patsubst %,~/%,$(SYMS))
DEST_DIR = $(patsubst %,~/%,$(DIRS))

VIM_PLUGINS = \
ctrlp.vim \
syntastic \
tabular \
vim-colors-solarized \
vim-commentary \
vim-fugitive \
vim-repeat \
vim-rhubarb \
vim-snippets \
vim-surround \
vim-unimpaired \
splitjoin.vim

VIM_PLUGIN_DEST = $(patsubst %,~/.vim/bundle/%,$(VIM_PLUGINS))

all: vim nvim git tmux zsh kak rg starship
vim: ~/.vimrc ~/.vim/bundle ~/.vim/autoload/pathogen.vim ~/.vim/my-snippets $(VIM_PLUGIN_DEST)
emacs: ~/.emacs.d ~/.emacs.d/init.el
git: ~/.gitconfig ~/.gitignore
screen: ~/.screenrc
tmux: ~/.tmux.conf
zsh: ~/.zshrc ~/.zsh_abk ~/.zsh_aliases_git ~/.zsh_aliases_kubernetes ~/.zsh_aliases_misc
emacs-gtk-key-bindings:
	gsettings set org.gnome.desktop.interface gtk-key-theme "Emacs"
rg: ~/.ripgreprc
nvim: ~/.config/nvim ~/.config/nvim/init.lua ~/.config/snippet ~/.config/snippet/go.json ~/.config/snippet/python.json ~/.config/snippet/rust.json
.PHONY: all vim nvim emacs git screen tmux zsh emacs-gtk-key-bindings kak rg starship

$(DEST_SYM):
	ln -s `pwd`/$(notdir $@) $@

~/.emacs.d/init.el: | ~/.emacs.d
	ln -s `pwd`/.emacs.d-init.el $@

$(DEST_DIR):
	mkdir -p $@

kak: ~/.config/kak ~/.config/kak/kakrc

starship: ~/.config/starship.toml

~/.vim/autoload/pathogen.vim: ~/.vim/autoload
	curl -SsLo ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

~/.vim/bundle/syntastic: | ~/.vim/bundle
	git clone https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic

~/.vim/bundle/ctrlp.vim: | ~/.vim/bundle
	git clone https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim

~/.vim/bundle/vim-fugitive: | ~/.vim/bundle
	git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive

~/.vim/bundle/vim-commentary: | ~/.vim/bundle
	git clone git@github.com:tpope/vim-commentary.git ~/.vim/bundle/vim-commentary

~/.vim/bundle/tabular: | ~/.vim/bundle
	git clone git@github.com:godlygeek/tabular.git ~/.vim/bundle/tabular

~/.vim/bundle/vim-colors-solarized: | ~/.vim/bundle
	git clone git@github.com:altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized

~/.vim/bundle/vim-snippets: | ~/.vim/bundle
	git clone https://github.com/honza/vim-snippets ~/.vim/bundle/vim-snippets

~/.vim/bundle/vim-surround: | ~/.vim/bundle
	git clone git@github.com:tpope/vim-surround.git ~/.vim/bundle/vim-surround

~/.vim/bundle/vim-repeat: | ~/.vim/bundle
	git clone git@github.com:tpope/vim-repeat.git ~/.vim/bundle/vim-repeat

~/.vim/bundle/vim-rhubarb: | ~/.vim/bundle
	git clone https://github.com/tpope/vim-rhubarb.git ~/.vim/bundle/vim-rhubarb

~/.vim/bundle/vim-unimpaired: | ~/.vim/bundle
	git clone https://github.com/tpope/vim-unimpaired.git ~/.vim/bundle/vim-unimpaired

~/.vim/bundle/splitjoin.vim: | ~/.vim/bundle
	git clone https://github.com/AndrewRadev/splitjoin.vim ~/.vim/bundle/splitjoin.vim

~/.vim/my-snippets: | ~/.vim
	ln -s $(PWD)/vim-snippets ~/.vim/my-snippets

~/.config/nvim/init.lua: | ~/.config/nvim
	ln -s $(PWD)/init.lua ~/.config/nvim/init.lua

~/.config/snippet/go.json: | ~/.config/snippet
	ln -s $(PWD)/vscode/snippets/go.json ~/.config/snippet/go.json

~/.config/snippet/python.json: | ~/.config/snippet
	ln -s $(PWD)/vscode/snippets/python.json ~/.config/snippet/python.json

~/.config/snippet/rust.json: | ~/.config/snippet
	ln -s $(PWD)/vscode/snippets/rust.json ~/.config/snippet/rust.json
