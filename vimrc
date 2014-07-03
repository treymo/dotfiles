
" -----Vundle-----
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
Bundle 'edkolev/tmuxline.vim'
Bundle 'gregsexton/MatchTag'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
    " -> Install flake8, pep8, rubylint, etc
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'Valloric/YouCompleteMe'

filetype plugin indent on

" -----Autocmd-----
if has("autocmd")
  au bufwritepost .vimrc source $MYVIMRC "Source the vimrc file on save
endif


" -----Basic Settings-----
" Close Omni-Completion window when a selection is made.
autocmd CursorMovedI * if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif
colorscheme elflord
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
set softtabstop=2
set tabstop=2
set expandtab
set autoindent

" -----Language Specific Settings -----
au BufNewFile,BufRead *.xm setlocal ft=objc
au FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
au FileType python setlocal ts=4 sts=4 sw=4

" -----Status Bar-----
set laststatus=2
" TODO: Figure out powerline fonts in airline
" let g:airline_powerline_fonts = 1  " Show symbols in the status bar
let g:tmuxline_powerline_separators = 0

" -----Syntastic-----
let g:syntastic_python_checkers = ['flake8', 'pep8']

" -----Visual-----
set number " line numbers
set nohlsearch " highlight search results

" -----Windows-----
set wmh=0

" -----Custom Functions-----
:command! DTWS :%s/\s\+$//g
