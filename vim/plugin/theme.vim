colorscheme Tomorrow-Night

let g:airline_theme="bubblegum"
let g:airline_powerline_fonts=1
let g:airline#extensions#tmuxline#enabled = 0

command! -nargs=0 HighlightGroup :call <sid>highlight_group(<f-args>)

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
