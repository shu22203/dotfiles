augroup filetypedetect
  au BufRead,BufNewFile *.vim setfiletype vim
  au BufRead,BufNewFile *.erb setfiletype eruby.html
  au BufRead,BufNewFile *.ejs setfiletype ejs
  au BufRead,BufNewFile *.swift setfiletype swift
  au BufRead,BufNewFile *.kt setfiletype kotlin
augroup END

function! s:DetectEjs()
    if getline(1) =~ '^#!.*\<ejs\>'
        set filetype=ejs
    endif
endfunction

autocmd BufNewFile,BufRead * call s:DetectEjs()
