" -----Vundle-----
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'edkolev/tmuxline.vim'
Plugin 'gmarik/Vundle.vim'
Plugin 'gregsexton/MatchTag'
Plugin 'leafgarland/typescript-vim'
Plugin 'majutsushi/tagbar'
Plugin 'qpkorr/vim-bufkill'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'udalov/kotlin-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'wesQ3/vim-windowswap'

call vundle#end()
filetype plugin indent on

" -----Autocmd-----
if has("autocmd")
  au bufwritepost .vimrc source $MYVIMRC "Source the vimrc file on save
endif


  " Manage tmux window names
autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%:t"))


" -----Basic Settings-----
" Close Omni-Completion window when a selection is made.
autocmd CursorMovedI * if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif
let g:EclimCompletionMethod = 'omnifunc'
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme elflord
set backspace=2
set incsearch
set ignorecase
set smartcase


" -----Formatting-----
set textwidth=80
set formatoptions+=t  " To enable textwidth wrapping
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
au FileType python setlocal ts=4 sts=4 sw=4

" -----Map Keys-----
let mapleader = ","
set pastetoggle=<F2>

" Mappings for all modes
map <F5> :setlocal spell! spelllang=en_us<CR>
noremap <tab> :bnext<CR>
noremap <s-tab> :bprevious<CR>
map <C-n> :NERDTreeToggle<CR>

" Normal Mode Mappings
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l
nmap <Leader>j :JavaImport<CR>
nnoremap <silent> <F4> :call NERDComment('n', 'Toggle')<CR>
nmap <F8> :TagbarToggle<CR>

" Python specific key mappings
au FileType python map <silent> <leader>b oimport pdb; pdb.set_trace()<esc>
au FileType python map <silent> <leader>B Oimport pdb; pdb.set_trace()<esc>

" Insert Mode Mappings
inoremap jj <Esc>

" Visual Mode Mappings
vnoremap <silent> <F4> :call NERDComment('x', 'Toggle')<CR>gv

" -----Status Bar-----
"  Make sure terminal supports 256 colors for vim-airline.
set laststatus=2
let g:airline_powerline_fonts = 1
" Airline extensions
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1

" -----Syntastic-----
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_checkers = ['clang_tidy', 'cppclean']
let g:syntastic_cpp_check_header = 1
let g:syntastic_python_checkers = ['flake8']

" -----Visual-----
set number " show line numbers
set nohlsearch " don't highlight search results

" -----Windows-----
set wmh=0

" -----YouCompleteMe-----
let g:EclimCompletionMethod = 'omnifunc'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1

" -----Custom Functions-----
:command! DTWS :%s/\s\+$//g
