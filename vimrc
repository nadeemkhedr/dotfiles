" Vundle
set nocompatible              " be iMproved, required


call plug#begin('~/.vim/plugged')
"Syntax
Plug 'tpope/vim-git'
Plug 'vim-ruby/vim-ruby'

Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'othree/html5.vim'
Plug 'gavocanov/vim-js-indent'
Plug 'mxw/vim-jsx'
Plug 'leshill/vim-json'
Plug 'moll/vim-node'

Plug 'tpope/vim-markdown'
Plug 'mustache/vim-mustache-handlebars'
Plug 'ekalinin/Dockerfile.vim'
Plug 'ashisha/image.vim'

"Tests
Plug 'tpope/vim-dispatch'
Plug 'JarrodCTaylor/vim-ember-cli-test-runner'

"Plugs
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'bling/vim-bufferline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'thoughtbot/vim-rspec'
Plug 'rking/ag.vim'
Plug 'bkad/CamelCaseMotion'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'regedarek/ZoomWin'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'Valloric/MatchTagAlways'
Plug 'editorconfig/editorconfig-vim'
Plug 'elentok/plaintasks.vim'
Plug 'tmhedberg/matchit'
Plug 'terryma/vim-multiple-cursors'
Plug 'groenewege/vim-less'

Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'gcmt/taboo.vim'

" Plugs for writing
Plug 'junegunn/goyo.vim'

call plug#end()

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
set tabstop=2


" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" auto complete menu
set wildmenu

" highlight current line white space before cursor
set list
set listchars=trail:.

:command! W w

" Move between windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Resize windows
map <S-Left> <C-w><
map <S-Down> <C-w>-
map <S-Up> <C-w>+
map <S-Right> <C-w>>

" use <leader>d to delete a line without adding it to the yanked stack
nnoremap <silent> <leader>d "_d
vnoremap <silent> <leader>d "_d

" use <leader>c to replace text without yanking replaced text
nnoremap <silent> <leader>c "_c
vnoremap <silent> <leader>c "_c

" yank/paste to/from the OS clipboard
noremap <silent> <leader>y "+y
noremap <silent> <leader>Y "+Y
noremap <silent> <leader>p "+p
noremap <silent> <leader>P "+P

" paste without yanking replaced text in visual mode
vnoremap <silent> p "_dP
vnoremap <silent> P "_dp

" emmit  go to the end of the word and expand
imap <C-f> <Esc>$a<C-y>,
nmap <C-f> $a<C-y>,

vmap <Tab> >
vmap <S-Tab> <

" Delete buffer without destroying window
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

"Enter add line in normal mode
nmap <CR> o<Esc>

" Deselect selected text
nnoremap <silent> <Leader>/ :nohlsearch<CR>

" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
nmap <Leader>v :e $MYVIMRC<CR>

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Nerdtree
nmap <Leader>n :NERDTreeFind<CR>
nmap <Leader>m :NERDTreeToggle<CR>


" Statusbar
set laststatus=2

"let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v\.git$|\.sass-cache$|\.hg$|\.svn$|\.yardoc|node_modules|tmp|cache|bower_components$|\.idea$|vendor|\.meteor|jspm_packages$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

let g:ctrlp_root_markers = ['.ctrlp']
let g:NERDTreeChDirMode = 2

" UI
set t_Co=256
syntax on

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=200

set nospell

"colorscheme babymate256

"highcontrast"
colorscheme molokai

"low contrast"
"colorscheme hybrid
set background=dark

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

"Markdown
autocmd FileType markdown setlocal shiftwidth=4 softtabstop=4 tabstop=4 wrap linebreak nolist wrap lbr colorcolumn=0 synmaxcol=999999

" vim-jsx
let g:jsx_ext_required = 0 "make it run on any js file

" MatchTagAlways
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'mustache' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1
    \}
