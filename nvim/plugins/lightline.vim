let g:lightline = {
      \ 'colorscheme': 'tender',
      \ 'tabline': {
      \   'left': [
      \             ['bufferinfo'],
      \             ['separator'],
      \             ['bufferbefore', 'buffercurrent', 'bufferafter'],
      \           ],
      \   'right': [
      \             ['close']
      \           ]
      \ },
      \ 'active': {
      \   'left': [
      \             ['mode', 'paste'],
      \             ['readonly', 'filename', 'modified']
      \           ],
      \   'right': [
      \             ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'],
      \             ['fugitive', 'percent'],
      \             ['fileformat', 'fileencoding', 'filetype', 'lineinfo']
      \            ]
      \ },
      \ 'component_function': {
      \   'bufferinfo': 'lightline#buffer#bufferinfo',
      \   'fugitive': 'LightLineFugitive',
      \   'ale': 'LightLineAle',
      \   'cocstatus': 'coc#status',
      \   'currentFunction': 'CocCurrentFunction',
      \ },
      \ 'component_expand': {
      \   'buffercurrent': 'lightline#buffer#buffercurrent',
      \   'bufferbefore': 'lightline#buffer#bufferbefore',
      \   'bufferafter': 'lightline#buffer#bufferafter',
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \   'buffercurrent': 'warning',
      \   'bufferbefore': 'raw',
      \   'bufferafter': 'raw',
      \   'linter_checking': 'left',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'left',
      \ },
      \ 'component': {
      \   'separator': '',
      \ },
      \ 'separator': {'left': "\ue0b0", 'right': "\ue0b2"},
      \ 'subseparator': {'left': "\ue0b1", 'right': "\ue0b3"}
      \ }

function! LightLineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = "\ue0a0 "
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction
