" ==============================
" Plugin
" ==============================
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'puppetlabs/puppet-syntax-vim'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" Programming languages
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'vim-php/tagbar-phpctags.vim', {'for': 'php'}


" Colorscheme
Plug 'jacoborus/tender.vim', {'do': 'ln -fnsv ~/.vim/plugged/tender.vim/colors/* ~/.vim/colors' }

call plug#end()

filetype plugin indent on

" ==============================
" Plugin options
" ==============================
" -----------
" vim-airline
" -----------
let g:airline_powerline_fonts = 1
let g:airline_theme = 'tenderplus'
let g:airline#extensions#tabline#enabled = 1
let g:airline_enable_branch = 1
set laststatus=2

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
let g:neocomplete#sources#syntax#min_keyword_length = 2
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

"------------
" neosnippets
" -----------
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
  set conceallevel=2 concealcursor=i
endif



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
set splitright
set splitbelow

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
set mouse=a


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

" when move to search results, move to center
noremap n nzz
noremap N Nzz
noremap * *zz
noremap # #zz
noremap g* g*zz
noremap g# g#zz

" <C-p> to paste mode
set pastetoggle=<C-p>

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
































