command! -nargs=0 TmuxRefresh :call <sid>tmux_refresh(<f-args>)

function! s:tmux_refresh()
  silent! execute '!tmux refresh-client -S'
  redraw!
endfunction
