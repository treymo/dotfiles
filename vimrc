" -----Vundle-----
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'bling/vim-airline'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'dense-analysis/ale'
Plugin 'edkolev/tmuxline.vim'
Plugin 'gmarik/Vundle.vim'
Plugin 'gregsexton/MatchTag'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'leafgarland/typescript-vim'
Plugin 'majutsushi/tagbar'
Plugin 'qpkorr/vim-bufkill'
Plugin 'Raimondi/delimitMate'
Plugin 'rust-lang/rust.vim'
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

" -----Basic Settings-----
" Close Omni-Completion window when a selection is made.
autocmd CursorMovedI * if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif
let g:EclimCompletionMethod = 'omnifunc'
syntax enable
set background=dark
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

" -----Tmux conf-----
autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%:t"))
let g:airline#extensions#tmuxline#enabled = 0

" -----ALE (Asynchronous Lint Engine)-----
let g:airline#extensions#ale#enabled = 1
highlight ALEWarning ctermbg=DarkMagenta
let g:ale_open_list = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'go': ['gofmt', 'goimports'],
\}
let g:ale_fix_on_save = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

" TODO: Format file in "Vim, Programming (General, Language specific)" categories
" -----Visual-----
set number " show line numbers
set nohlsearch " don't highlight search results

if !&diff
  au VimEnter * NERDTree
  " Open NERDTree when not diffing, but don't start the cursor in NT.
  au VimEnter * 2wincmd w
  au FileType python,c,cpp,go TagbarOpen
endif

" -----Windows-----
set wmh=0

" -----YouCompleteMe-----
let g:EclimCompletionMethod = 'omnifunc'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
"
" -----Tagbar-----
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }
