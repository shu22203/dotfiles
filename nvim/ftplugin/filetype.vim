augroup filetypedetect
  au BufRead,BufNewFile *.vim setfiletype vim
  au BufRead,BufNewFile *.erb setfiletype eruby.html
  au BufRead,BufNewFile *.swift setfiletype swift
  au BufRead,BufNewFile *.kt setfiletype kotlin
augroup END
