" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set ruler
set laststatus=2
set background=dark
set history=50
set showcmd
set incsearch
set nohlsearch
set ignorecase
set smartcase
set nowrap
set expandtab
set tabstop=4
set shiftwidth=4
set showfulltag
" change xterm titles to name of file
set title
set wrap
set nocompatible
set wildmenu
set autowrite
autocmd BufEnter * silent! lcd %:p:h
set grepprg=ag
iab pdb import pdb; pdb.set_trace()
syntax on
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
" set tags+=~/.vim/systags
set tags=./tags;
" add subdirectories to search path
set path+=**
" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

autocmd BufEnter *.html setlocal sw=2 ts=2
autocmd BufEnter *.zcml setlocal ft=xml sw=2 ts=2
autocmd BufEnter *.js setlocal sw=2 ts=2
autocmd BufEnter *.pt setlocal ft=xml sw=2 ts=2
autocmd BufEnter *.mako setlocal ft=html sw=2 ts=2
autocmd BufEnter *.rb setlocal sw=2 ts=2
autocmd BufEnter *.cljs setlocal ft=clojure
autocmd BufEnter *.jade setlocal ft=text sw=2 ts=2
autocmd BufEnter *.go setlocal ft=go sw=4 ts=4
autocmd BufEnter *.yaml setlocal ft=yaml sw=2 ts=2
autocmd BufEnter *.proto setlocal ft=proto sw=2 ts=2
"autocmd BufEnter *.compose-mode setlocal ft=mail
"autocmd BufEnter *.forward-mode setlocal ft=mail
"autocmd BufEnter *.reply-mode setlocal ft=mail
"autocmd BufEnter *.resume-mode setlocal ft=mail

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

call pathogen#infect()

"colorscheme elflord
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized

let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_c_include_dirs = [expand("~/opt/include")]
let g:syntastic_python_checkers=['flake8']
let g:syntastic_always_populate_loc_list = 1

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11'

" handled by vim-go plugin
let g:syntastic_go_checkers = []

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

if filereadable(expand("~/.vimrc.local"))
  exec ":so ~/.vimrc.local"
endif

nnoremap <leader>1 yypVr=
nnoremap <leader>2 yypVr-

nmap <leader>c  :CtrlPClearAllCaches

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>m  <Plug>(go-imports)
autocmd FileType go nmap <leader>i  <Plug>(go-info)
autocmd FileType go nmap <leader>h  <Plug>(go-doc)
autocmd FileType go nmap <leader>l  <Plug>(go-metalinter)
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
" autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
autocmd FileType go nmap <leader>d  :GoDecls
autocmd FileType go nmap <leader>D  :GoDeclsDir
