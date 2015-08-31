command! -nargs=0 HighlightGroup :call <sid>highlight_group(<f-args>)

let g:airline_theme="bubblegum"
let g:airline_powerline_fonts=1
let g:airline#extensions#tmuxline#enabled = 0

colorscheme Tomorrow-Night

hi clear CursorLineNR
hi CursorLineNR ctermbg=240 ctermfg=3
hi diffAdded ctermfg=2
hi diffNewFile ctermfg=3
hi diffRemoved ctermfg=1
hi gitcommitDiff ctermfg=244

" Setting highlight colors for diff mode doesn't seem work
" since vimdiff overwrites these values when it loads. As a
" workaround we'll just define the highlight rules with an
" autocmd that fires after vimdiff is already loaded
augroup diff
  autocmd!
  autocmd FilterWritePost *
    \ if &diff |
    \   hi diffAdded ctermfg=2 |
    \   hi diffNewFile ctermfg=3 |
    \   hi diffRemoved ctermfg=1 |
    \   hi gitcommitDiff ctermfg=244 |
    \   hi DiffChange ctermbg=235 |
    \   hi DiffDelete ctermbg=234 ctermfg=234 |
    \   hi DiffAdd ctermbg=235 |
    \   hi DiffText ctermbg=237 |
    \ endif
augroup END

" Syntax highlighting
augroup filetypes
  autocmd!
  autocmd BufNewFile,BufRead .env* set filetype=sh
  autocmd BufNewFile,BufRead Dockerfile set filetype=dockerfile
  autocmd BufNewFile,BufRead *.msx let b:jsx_ext_found = 1
  autocmd BufNewFile,BufRead *.msx set filetype=javascript
  autocmd BufNewFile,BufRead *.arb set filetype=ruby
  autocmd BufNewFile,BufRead *.tmux set filetype=tmux
  autocmd BufNewFile,BufRead *.zsh.sh set filetype=zsh
augroup END

" List highlight groups for the object under cursor
function! s:highlight_group()
  let line = line(".")
  let col = col(".")
  let hi = synIDattr(synID(line, col, 1), "name")
  let trans = synIDattr(synID(line, col, 0), "name")
  let lo = synIDattr(synIDtrans(synID(line , col ,1)), "name")
  echo "hi<".hi."> trans<".trans."> lo<".lo.">"
endfunction
