" -----Vundle-----
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
    " -> Install powerline fonts,
    "  https://powerline.readthedocs.org/en/master/installation/linux.html
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'edkolev/tmuxline.vim'
Plugin 'gmarik/Vundle.vim'
Plugin 'gregsexton/MatchTag'
Plugin 'majutsushi/tagbar'
Plugin 'qpkorr/vim-bufkill'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
    " -> Install flake8, pep8, rubylint, etc
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'wesQ3/vim-windowswap'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on

" -----Autocmd-----
if has("autocmd")
  au bufwritepost .vimrc source $MYVIMRC " Source the vimrc file on save
endif

autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%:t"))


" -----Basic Settings-----
" Close Omni-Completion window when a selection is made.
autocmd CursorMovedI * if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
set backspace=2
set incsearch
set ignorecase
set smartcase


" -----Formatting-----
set textwidth=80
au FileType java setlocal textwidth=100
" Highlight trailing whitespace
au VimEnter,ColorScheme * highlight ExtraWhitespace guibg=red ctermbg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

" -----Indentation-----
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set autoindent

" -----Language Specific Settings -----
au BufNewFile,BufRead *.xm setlocal ft=objc
au FileType make setlocal ts=8 sts=8 sw=8 noexpandtab

" -----Map Keys-----
inoremap jj <Esc>
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l
noremap <tab> :bnext<CR>
noremap <s-tab> :bprevious<CR>
set pastetoggle=<F2>
map <F5> :setlocal spell! spelllang=en_us<CR>
vnoremap <silent> <F4> :call NERDComment('x', 'Toggle')<CR>gv
nnoremap <silent> <F4> :call NERDComment('n', 'Toggle')<CR>
let mapleader = ","
nmap <leader>ne :NERDTree<cr>

" -----Status Bar-----
"  Make sure terminal supports 256 colors for vim-airline.
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0  " Show symbols in the status bar

" -----Syntastic-----
let g:syntastic_python_checkers = ['flake8']

" -----Visual-----
set number " line numbers
set nohlsearch " highlight search results

" -----Windows-----
set wmh=0

" -----YouCompleteMe-----
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1

" -----Custom Functions-----
:command! DTWS :%s/\s\+$//g
