colorscheme Tomorrow-Night

" Use both relative and absolute line numbering
set relativenumber
set number

let g:airline_theme="bubblegum"
let g:airline_powerline_fonts=1
let g:airline#extensions#tmuxline#enabled=0

hi clear CursorLineNR
hi CursorLineNR ctermbg=240 ctermfg=3

hi DiffAdd ctermbg=235 ctermfg=2
hi DiffChange ctermbg=235 ctermfg=238
hi DiffDelete ctermbg=235 ctermfg=1
hi DiffText ctermbg=235 ctermfg=244

" augroup diff
"   autocmd!
"   autocmd FilterWritePre *
"     \ if &diff |
"     \   setlocal syntax=unknown |
"     \   hi! Normal ctermfg=237 |
"     \ endif
" augroup END

" Echo the highlight groups for the object under cursor
command! -nargs=0 HighlightGroup :call <sid>highlight_group(<f-args>)

function! s:highlight_group()
  let line = line(".")
  let col = col(".")
  let hi = synIDattr(synID(line, col, 1), "name")
  let trans = synIDattr(synID(line, col, 0), "name")
  let lo = synIDattr(synIDtrans(synID(line , col ,1)), "name")
  echo "hi<".hi."> trans<".trans."> lo<".lo.">"
endfunction
