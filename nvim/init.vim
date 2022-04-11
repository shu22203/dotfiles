if &compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

augroup QuickFixCmd
  autocmd!
  autocmd QuickFixCmdPost *grep* cwindow
augroup END

" https://qiita.com/kawaz/items/ee725f6214f91337b42b
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.nvim') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

let &runtimepath = s:dein_repo_dir . "," . &runtimepath

let s:toml = fnamemodify(expand('<sfile>'), ':h') . '/dein.toml'
let s:lazy_toml = fnamemodify(expand('<sfile>'), ':h') . '/dein_lazy.toml'

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml)
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

" Required:
syntax enable
filetype plugin indent on

" ==============================
" Init
" ==============================
set modelines=5

" display
set title
set relativenumber number
set ruler
set showmatch
set wrap
set whichwrap=b,s,h,l,<,>,[,]
set cursorline
set showtabline=2

" tab, indent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab
set autoindent
set smartindent

" others
set autochdir
set backspace=indent,eol,start
set wildmenu
set mouse=a
set completeopt=menu
set hidden

" cursor
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

if has('gui_running')
    set t_Co=16
    let g:solarized_termcolors=16
else
    " http://stackoverflow.com/questions/7278267/incorrect-colors-with-vim-in-iterm2-using-solarized
    let g:solarized_termtrans=1
  endif
set background=dark
let g:hybrid_use_iTerm_colors = 1
colorscheme codedark
highlight Normal ctermbg=none

" ==============================
" Searching and Moving
" ==============================
set ignorecase
set smartcase
set incsearch
set hlsearch
set wrapscan

" ==============================
" Key Bind
" ==============================
let mapleader = ","

" Swap colon and semicolon
nnoremap : ;
nnoremap ; :

" Change key <ESC>
vnoremap <C-j> <ESC>
noremap! <C-j> <ESC>
tnoremap <Esc> <C-\><C-n>
tnoremap <C-j> <C-\><C-n>

" scroll line in normal node
nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>

" Move by display lime
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <Down> gj
nnoremap <Up> gk

" Move to top and end
noremap <S-h> ^
noremap <S-l> $
noremap <ESC><ESC> :noh<CR>

" quickfix
nnoremap cn :cnext<CR>
nnoremap cp :cprev<CR>

" Write and quit
nnoremap <Leader>w :w<CR>
nnoremap <leader>q :Bclose<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>qq :q!<CR>

" Not yunk on pasting with visual mode
vnoremap p "_dP

" autocomp palenthesis
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" when move to search results, move to center
noremap n nzz
noremap N Nzz
noremap * *zz
noremap # #zz
noremap g* g*zz
noremap g# g#zz
noremap <C-]> <C-]>zz
noremap <C-i> <C-i>zz
noremap <C-o> <C-o>zz

" <C-p> to paste mode
set pastetoggle=<Leader>p

" Creating underline/overline headings for markup kanguages
nnoremap <Leader>1 yyPVr=jyypVr=
nnoremap <Leader>2 yyPVr*jyypVr*
nnoremap <Leader>3 yyPVr-jyypVr-
nnoremap <Leader>4 yyPVr=
nnoremap <Leader>5 yyPVr-
nnoremap <Leader>6 yyPVr^
nnoremap <Leader>7 yyPVr"

" ==========================
" Language
" ==========================
set fileformats=unix,dos,mac

" ==========================
" Clipboard
" ==========================
set clipboard+=unnamedplus

" ==========================
" Programming
" ==========================
set foldmethod=syntax

" ==========================
" special Key
" ==========================
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«
highlight specialKey ctermfg=darkgray

" ==========================
" Backup
" ==========================
set autowrite
set hidden
set backup
set backupdir=$HOME/.vimback
set directory=$HOME/.vimtmp
set history=10000
set updatetime=500

" ==========================
" Status Line
" ==========================
set showcmd
set laststatus=2

" ==========================
" Window
" ==========================
set splitright "Window Split時に新Windowを右に表示
set splitbelow "Window Split時に新windowを下に表示

" ==========================
" Split Window
" ==========================

nnoremap s <Nop>
" Move window
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sw <C-w>w
" Move window itself
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
" Rotate window (horizontal, vertical)
nnoremap sr <C-w>r
" Fix window size
nnoremap s= <C-w>=
nnoremap sO <C-w>=
" Maximize vertical size
nnoremap so <C-w>_<C-w>|
" Separate window horizontal/vertical
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
" Delete buffer
nnoremap sq :Bclose<CR>
" Delete window
nnoremap sQ :<C-u>q<CR>
" Move buffer
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprev<CR>

" Resize window
call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

" --------------
" vim-indent
" --------------
" Auto startup
let g:indent_guides_enable_on_vim_startup = 1
