function! s:GetBufferList()
  redir => buflist
  silent! ls
  redir END
  return buflist
endfunction

" Echo the highlight groups for the object under cursor
function! s:highlight_group()
  let line = line(".")
  let col = col(".")
  let hi = synIDattr(synID(line, col, 1), "name")
  let trans = synIDattr(synID(line, col, 0), "name")
  let lo = synIDattr(synIDtrans(synID(line , col ,1)), "name")
  echo "hi<".hi."> trans<".trans."> lo<".lo.">"
endfunction

" Toggle the quickfix window (:copen and :cclose)
function! ToggleQuickfixList()
  for bufnum in map(filter(split(s:GetBufferList(), '\n'), 'v:val =~ "Quickfix List"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      cclose
      return
    endif
  endfor
  let winnr = winnr()
  if exists("g:toggle_list_copen_command")
    exec(g:toggle_list_copen_command)
  else
    copen
  endif
  if winnr() != winnr
    wincmd p
  endif
endfunction
