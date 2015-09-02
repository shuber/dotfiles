set rtp+=/usr/local/Cellar/fzf/0.10.2

nmap <leader>f :FZF<cr>

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, "\n")
endfunction

function! s:bufopen(e)
  execute "buffer" matchstr(a:e, "^[ 0-9]*")
endfunction
