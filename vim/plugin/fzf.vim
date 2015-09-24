set rtp+=/usr/local/opt/fzf

nmap <leader>f :FZF! -x<cr>

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, "\n")
endfunction

function! s:bufopen(e)
  execute "buffer" matchstr(a:e, "^[ 0-9]*")
endfunction
