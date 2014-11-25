" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-bufferline'
Bundle 'jlanzarotta/bufexplorer'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'thoughtbot/vim-rspec'
Plugin 'mileszs/ack.vim'
Plugin 'bkad/CamelCaseMotion'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'regedarek/ZoomWin'
Plugin 'tpope/vim-unimpaired'

call vundle#end()            " required
filetype plugin indent on    " required

set encoding=utf-8
" Turn on line numbers
set number
" Relative line numbers
set rnu

" Make backspace delete characters
set backspace=2

" I like my leader being ','. It's easier to reach
" It defaults to ]
let mapleader = ","

" Disable backup and swap files
set nobackup
set noswapfile


" Improve Unix/Windows compatibility
set viewoptions=folds,options,cursor,unix
" Allow the cursor to pass the last character
set virtualedit=onemore
" Store more command history
set history=100
" Store a bunch of undo history
set undolevels=400
" Allow buffer switching without saving
set hidden

" Show matching brackets/parenthesis
set showmatch
" Don't blink
set matchtime=0
" Find as you type search
set incsearch
" Highlight search terms
set hlsearch
" Windows can be 0 line high
set winminheight=0
" Case insensitive search
set ignorecase
" Case sensitive if we type an uppercase
set smartcase

" tabs to spaces & set width to be 2
set expandtab
set shiftwidth=2
set softtabstop=2


" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" auto complete menu
set wildmenu

" Mapping
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
nmap <Leader>n :NERDTreeFind<CR>
nmap <Leader>m :NERDTreeToggle<CR>
nmap <CR> o<Esc>
nnoremap <silent> <Leader>/ :nohlsearch<CR>

" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
nmap <Leader>v :e $MYVIMRC<CR>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Statusbar
set laststatus=2

"let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v\.git$|\.sass-cache$|\.hg$|\.svn$|\.yardoc|node_modules$|\.idea$|vendor',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

let g:ctrlp_root_markers = ['.ctrlp']
let g:NERDTreeChDirMode = 2

" UI
set t_Co=256
syntax on

set nospell
"colorscheme jellybeans
set background=dark
colorscheme peaksea

set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

"GitGutter
highlight clear SignColumn

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

autocmd BufNewFile,BufRead *.js.es6 set syntax=javascript
autocmd BufNewFile,BufRead *.hb set syntax=mustache
