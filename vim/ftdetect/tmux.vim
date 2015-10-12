autocmd BufNewFile,BufRead *.tmux set filetype=tmux
autocmd BufWrite * :TmuxRefresh
