
" -----Vundle-----
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'maciakl/vim-neatstatus'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails'
Bundle 'Valloric/YouCompleteMe'

filetype plugin indent on

" -----Basic Settings-----
syntax on
set background=dark
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

" -----Map Keys-----
inoremap jj <Esc>
nmap <C-J> <C-W>j<C-W>_
nmap <C-K> <C-W>k<C-W>_
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l
set pastetoggle=<F2>
map <F5> :setlocal spell! spelllang=en_us<CR>
vnoremap <silent> <F4> :call NERDComment('x', 'Toggle')<CR>gv
nnoremap <silent> <F4> :call NERDComment('n', 'Toggle')<CR>
let mapleader = ","
nmap <leader>ne :NERDTree<cr>

" -----Indentation-----
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent

" -----Language Settings -----
au BufNewFile,BufRead *.xm setlocal ft=objc

" -----Status Bar -----
set laststatus=2

" -----Visual-----
set number " line numbers
set nohlsearch " highlight search results

" -----Windows-----
set wmh=0
