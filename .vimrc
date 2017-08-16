" ==============================
" Plugin
" ==============================
call plug#begin()

" Style
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'

" Markdown
Plug 'plasticboy/vim-markdown'
Plug 'kannokanno/previm'
Plug 'tyru/open-browser.vim'

" Directory tree
Plug 'scrooloose/nerdtree'

" Utils
Plug 'jacoborus/tender.vim'
Plug 'Shougo/unite.vim'
Plug 'tpope/vim-markdown'
Plug 'thinca/vim-quickrun'

" Complesion snippets
if has('lua') && (( v:version == 703 && has('patch885')) || (v:version >= 704))
  Plug 'Shougo/neocomplete'
else 
  Plug 'Shougo/neocomplecache'
endif
Plug 'honza/vim-snippets'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" Programming languages
Plug 'puppetlabs/puppet-syntax-vim'
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'vim-php/tagbar-phpctags.vim', {'for': 'php'}
Plug 'hynek/vim-python-pep8-indent',{'for': 'python'}

call plug#end()

filetype plugin indent on


" ==============================
" Init
" ==============================
set modelines=5

" display
set title
set number
set ruler
set showmatch
set wrap
set whichwrap=b,s,h,l,<,>,[,]
set cursorline

" tab, indent
"
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab
set autoindent
set smartindent


" others
set backspace=indent,eol,start
set wildmenu
" set wildmode=list:full
set wildmode=full:list
set mouse=a
set completeopt=menu
set hidden

if has('gui_running')
    set t_Co=16
    let g:solarized_termcolors=16
else
    " http://stackoverflow.com/questions/7278267/incorrect-colors-with-vim-in-iterm2-using-solarized
    let g:solarized_termtrans=1
  endif
set background=dark
colorscheme solarized

let g:markdown_fenced_languages = [
\  'css',
\  'go',
\  'javascript',
\  'js=javascript',
\  'json=javascript',
\  'ruby',
\  'sass',
\  'xml',
\  'erlang',
\  'sql',
\]

" ==============================
" Searching and Moving
" ==============================
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set hlsearch
set wrapscan


" ==============================
" Key Bind
" ==============================
let mapleader = ","

" Change key <ESC>
noremap <C-j> <ESC>
noremap! <C-j> <ESC>

" Move by display lime
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <Down> gj
nnoremap <Up> gk

" <Enter> always mean inserting line
nnoremap <CR> o<ESC>
nnoremap <S-CR> O<ESC>

" Move to top and end
noremap <S-h> ^
noremap <S-j> <S-l>
noremap <S-k> <S-h>
noremap <S-l> $
noremap <ESC><ESC> :noh<CR>

" Write and quit
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>qq :q!<CR>

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

" <C-p> to paste mode
set pastetoggle=<Leader>p

" Easy moving along splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Creating underline/overline headings for markup kanguages
nnoremap <Leader>1 yyPVr=jyypVr=
nnoremap <Leader>2 yyPVr*jyypVr*
nnoremap <Leader>3 yyPVr-jyypVr-
nnoremap <Leader>4 yyPVr=
nnoremap <Leader>5 yyPVr-
nnoremap <Leader>6 yyPVr^
nnoremap <Leader>7 yyPVr"

" ==============================
" Language
" ==============================
set encoding=utf-8
set fileformats=unix,dos,mac

" ==============================
" Clipboard
" ==============================
set clipboard+=autoselect

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
" File Type
" ==========================
if has('autocmd')
  autocmd BufNewFile,BufRead *.go setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType go nmap <leader>b  <Plug>(go-build)
  autocmd FileType go nmap <leader>r  <Plug>(go-run)
  autocmd FileType go nmap <leader>t  <Plug>(go-test)
endif

autocmd BufNewFile,BufRead *.{html,htm,tmpl} set filetype=html

" ==========================
" Window
" ==========================
set splitright "Window Split時に新Windowを右に表示
set splitbelow "Window Split時に新windowを下に表示

" ==========================
" Split Window
" ==========================

nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>
nnoremap sf :<C-u>Unite file<CR>
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

" ==============================
" Plugin options
" ==============================
" -----------
" vim-airline
" -----------
let g:airline_powerline_fonts = 1
" let g:airline_theme = 'solarized'
let g:airline_theme = 'tender'
let g:airline#extensions#tabline#enabled = 1
let g:airline_enable_branch = 1

" -----------
" neocomplete
" -----------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 1
" 区切り文字まで補完する
let g:neocomplete#enable_auto_delimiter = 1
" 1文字目の入力から補完のポップアップを表示
let g:neocomplete#auto_completion_start_length = 1
" バックスペースで補完のポップアップを閉じる
inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"

let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
" connect a dictionary file with filetype.
let g:neocomplete#sources#dictionary#dictionaries = {
  \ '_'   : '',
  \ 'php' : '~/.vim/dict/PHP.dict',
  \ 'tex' : '~/.vim/plugged/vim-latex/ftplugin/latex-suite/dictionaries/dictionary',
  \}
" for vim-R-plugin
let g:neocomplete#sources#omni#input_patterns.r = '[[:alnum:].\\]\+'
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" -----------
" neosnippets
" -----------
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/'

" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
 
" For snippet_complete marker.
if has('conceal')
  set conceallevel=1 concealcursor=i
endif

"------------
" vim-go
" -----------
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_snippet_engine = "neosnippet"

" --------------
" open browser
" --------------
au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a "Google Chrome"'

" --------------
" NERDTree
" --------------
nnoremap <silent><C-e> :NERDTreeToggle<CR>
