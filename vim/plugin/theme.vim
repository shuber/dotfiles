command! -nargs=0 HighlightGroup :call <sid>highlight_group(<f-args>)

let g:airline_theme="bubblegum"
let g:airline_powerline_fonts=1
let g:airline#extensions#tmuxline#enabled = 0

colorscheme Tomorrow-Night

hi clear CursorLineNR
hi CursorLineNR ctermbg=240 ctermfg=3

hi Title ctermfg=3
hi markdownCode ctermfg=1
hi markdownLinkText ctermfg=4
hi markdownListMarker ctermfg=2
hi markdownUrl ctermbg=236 ctermfg=242

" Setting highlight colors for diff mode doesn't seem work
" since vimdiff overwrites these values when it loads. As a
" workaround we'll just define the highlight rules with an
" autocmd that fires after vimdiff is already loaded
augroup diff
  autocmd!
  autocmd FilterWritePre *
    \ if &diff |
    \   setlocal syntax=unknown |
    \   hi! Normal ctermfg=237 |
    \ endif
augroup END

hi DiffAdd ctermbg=235 ctermfg=2
hi DiffChange ctermbg=235 ctermfg=238
hi DiffDelete ctermbg=235 ctermfg=1
hi DiffText ctermbg=235 ctermfg=244

" Syntax highlight
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
