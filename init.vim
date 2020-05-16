" Used Shortcuts:
" ]m, [m next and prev method
" <C-d> expands selection
" <C-e>, <C-y> scroll down and up
" zb, zt, zz change view screen
" H, M, L change cursor
" * search for text under the word
" m then anything to mark, ` then same char to go to mark
" <c-^> switch between last 2 edited files
"
" # COC configs
" # Shortcuts:
" # normal: K shows documentation (<c-w>p to focus on the popup)
" # insert: <c-space> autocomplete
"
"
" # Git Gutter
" jump to next hunk (change): ]c
" jump to previous hunk (change): [c.

" # COC actions
" <leader>c(selector)

call plug#begin('~/.vim/plugged')

" autocomplete, lint, prettier
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" fuzzy find/search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'unblevable/quick-scope'

" Javascript
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
"Git
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'jparise/vim-graphql'

" Go lang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'junegunn/goyo.vim' " Run using :Goyo command for focus mode
Plug 'junegunn/limelight.vim'

"Plugs
Plug 'wesQ3/vim-windowswap' " Swap windows <leader>s

" featurees
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

"Want to turn fooBar into foo_bar? Press crs (coerce to snake_case). MixedCase (crm), camelCase (crc), snake_case (crs), UPPER_CASE (cru), dash-case (cr-), dot.case (cr.), space case (cr<space>), and Title Case (crt) are all just 3 keystrokes away.
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tmhedberg/matchit'
Plug 'mattn/emmet-vim'
Plug 'bkad/CamelCaseMotion'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'matze/vim-move' " In visual mode, hold <A-move> to move lines
Plug 'machakann/vim-highlightedyank'
Plug 'mhinz/vim-startify' " Startup screen
Plug 'kristijanhusak/vim-carbon-now-sh' " code screenshots using :CarbonNowSh cmd

" theme
Plug 'itchyny/lightline.vim'

" colorscheme
Plug 'flazz/vim-colorschemes'
Plug 'rafi/awesome-vim-colorschemes'

"Tab rename
Plug 'gcmt/taboo.vim'

" snippets
Plug 'honza/vim-snippets'

" shortcuts
Plug 'liuchengxu/vim-which-key'

" vifm
Plug 'vifm/vifm.vim'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn on line numbers
set number
" Relative line numbers
set rnu

" Make backspace delete characters
set backspace=2

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

" set column 81 with special color
set colorcolumn=81

" auto complete menu
set wildmenu

" highlight current line white space before cursor
set list
set listchars=trail:.


set cursorcolumn " highlight current column
" nvim
" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if has('nvim')
  tnoremap <M-[> <C-\><C-n>
  set inccommand=split
endif

" mouse support to resize splits mainly
if has('mouse')
  set mouse=a
endif

:command! W w

noremap <leader>x <C-w>c
noremap <leader>q :bd<CR>

"""""""""""""""""""""""""""""""
" => Splits & Tabs
"""""""""""""""""""""""""""""""
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j

" Make adjusing split sizes a bit more friendly
noremap <silent> <S-Left> :vertical resize +3<CR>
noremap <silent> <S-Right> :vertical resize -3<CR>
noremap <silent> <S-Up> :resize +3<CR>
noremap <silent> <S-Down> :resize -3<CR>

" windowswap
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>s :call WindowSwap#EasyWindowSwap()<CR>

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <leader>z :ZoomToggle<CR>

" tab shortcuts
noremap <leader>tt :tab split<CR>
noremap <leader>tc :tabe<CR>
noremap <leader>tx :tabclose<CR>
noremap <leader>tr :TabooRename<Space>

" Move between tabs by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

let g:taboo_tab_format = ' [%N]%f%m '
let g:taboo_renamed_tab_format = ' [%N]%l%m '


"""""""""""""""""""""""""""""""
" => Yanking & Pasting
"""""""""""""""""""""""""""""""

" yank/paste to/from the OS clipboard
noremap <silent> <leader>y "+y
noremap <silent> <leader>yy "+y
noremap <silent> <leader>Y "+Y
noremap <silent> <leader>p "+p
noremap <silent> <leader>P "+P


" paste without yanking replaced text in visual mode
vnoremap <silent> p "_dP
vnoremap <silent> P "_dp


" Basic copy
"nmap <leader>yf :let @" = expand("%")<cr>

" Bug: Potential problems if dir name has '.' in it
" Copy file path, remove extention, 'src/' & 'index.*' if its at the end
function! s:yank_file()
  let path = expand("%")
  let pathList = split(path, '\.')

  " name is in root
  if(len(pathList) == 0)
    echo path
    return path
  endif

  " remove extention if its a js or a ts file
  let ext = pathList[len(pathList) - 1]
  if(ext == 'js' || ext == 'jsx' || ext == 'ts' || ext == 'tsx')
    let path = pathList[0]
    let pathList = split(path, '/')
  endif

  " check if file ends with /index, then remove it
  let lastSegment = pathList[len(pathList) - 1]
  if(lastSegment == 'index')
    let list = split(path, '/index')
    let path = list[0]
  endif

  " check if file starts with src/, then remove it
  let firstSegment = pathList[0]
  if(firstSegment == 'src')
    let list = split(path, 'src/')
    let path = list[0]
  endif

  " last item is not an index
  echo path
  return path
endfunction
nmap <leader>yf :let @"=<SID>yank_file()<CR>


"""""""""""""""""""""""""""""""
" => Emmet
"""""""""""""""""""""""""""""""
" emmet  go to the end of the word and expand
imap <C-f> <Esc>$a<C-y>,
nmap <C-f> $a<C-y>,

let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  }
\}

"""""""""""""""""""""""""""""""
" => fugitive
"""""""""""""""""""""""""""""""
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

"""""""""""""""""""""""""""""""
" => Goyo & Markdown
"""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1
nnoremap <Leader>` :Goyo<CR>
nnoremap <Leader>l :Limelight!!<CR>
xmap <Leader>l <Plug>(Limelight)
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

autocmd FileType markdown setlocal shiftwidth=4 softtabstop=4 tabstop=4 wrap linebreak nolist wrap lbr colorcolumn=0 synmaxcol=999999

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Enter add line in normal mode
nmap <CR> o<Esc>

" Deselect selected text
nnoremap <silent> <Leader>/ :nohlsearch<CR>


" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
nmap <Leader>ov :e $MYVIMRC<CR>

" find and edit a ".env" file in a git project dir
function! s:edit_env_file()
let dir = finddir('.git/..', expand('%:p:h').';')
let file = findfile('.env', dir)
execute "e ".fnameescape(file)
endfunction
nnoremap  <Leader>oe :call <SID>edit_env_file()<CR>



"""""""""""""""""""""""""""""""
" => FZF
"""""""""""""""""""""""""""""""
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
nnoremap <C-p> :GFiles<CR>


"""""""""""""""""""""""""""""""
" => Ack
"""""""""""""""""""""""""""""""
nnoremap <Leader>a :Ack!<Space>
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

"""""""""""""""""""""""""""""""
" => Nerdtree
"""""""""""""""""""""""""""""""
nmap <Leader>n :NERDTreeFind<CR>
nmap <Leader>m :NERDTreeToggle<CR>
" if there are multiple plugins active that shows something on the left of the
" files
" let g:NERDTreeChDirMode = 2


"""""""""""""""""""""""""""""""
" => Theme
"""""""""""""""""""""""""""""""
set t_Co=256
syntax on

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=200

set nospell


set background=dark

colorscheme purify
" colorscheme gruvbox
" colorscheme material-theme


"""""""""""""""""""""""""""""""
" => Strip trailling whitespaces on save
"""""""""""""""""""""""""""""""
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


"""""""""""""""""""""""""""""""
" => CamelCaseMotion
"""""""""""""""""""""""""""""""
call camelcasemotion#CreateMotionMappings('<leader>')


"""""""""""""""""""""""""""""""
" => Lightline
"""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'purify',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'filenameOrLastFolderOfIndex', 'modified', 'readonly'] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'filenameOrLastFolderOfIndex', 'modified', 'readonly' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filenameOrLastFolderOfIndex': 'LightLineFixIndexFiles',
      \ },
      \ }
function! LightLineFixIndexFiles()
    let filenameonly = expand('%:t:r')
    if filenameonly ==? "index"
        return remove(split(expand("%:h"), "/"), -1) . "/" . expand("%:t")
    else
        return expand("%:t")
    endif
endfunction

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

"""""""""""""""""""""""""""""""
" => Vifm
"""""""""""""""""""""""""""""""
map <Leader>vv :Vifm<CR>
map <Leader>vs  :VsplitVifm<CR>
map <Leader>vp  :SplitVifm<CR>

"""""""""""""""""""""""""""""""
" => vim-which-key
"""""""""""""""""""""""""""""""
nnoremap <silent> <leader> :WhichKey ','<CR>

"""""""""""""""""""""""""""""""
" => quickscope
"""""""""""""""""""""""""""""""
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#eF5F70' gui=underline ctermfg=81 cterm=underline

let g:qs_max_chars=150

"""""""""""""""""""""""""""""""
" => GoLang
"""""""""""""""""""""""""""""""
" coc-go
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

"""""""""""""""""""""""""""""""
" => COC
"""""""""""""""""""""""""""""""

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=auto:2

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" customized for coc snippet
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gv :call CocAction('jumpDefinition', 'vsplit')<CR>

nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rz <Plug>(coc-refactor)

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>c :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>c :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" Remap for format selected region
nmap <leader>f  :Format<CR>

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" coc-word add more words for auto completion
" coc-emoji add : auto complete for emoji in markdown files
" coc-spell-checker: spell checker, use code action to see the list
" coc-actions: dropdown style for actions works on neovim
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-word',
  \ 'coc-spell-checker',
  \ 'coc-emoji',
  \ 'coc-actions',
  \ 'coc-cssmodules',
  \ 'coc-go'
  \ ]

"""""""""""""""""""""""""""""""
" => Vim startify
"""""""""""""""""""""""""""""""
let g:startify_change_to_vcs_root = 1
let g:startify_bookmarks = [ {'p': '~/work/procella/client'} ]
