" Let ctrl-p manage tag navigation
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>

" Custom ignore patterns for the ctrl-p plugin
let g:ctrlp_custom_ignore = '\v[\/]((\.(git|hg|svn))|(public\/(system|uploads))|tmp|vendor/bundle)$'

" Allow ctrl-p to show hidden files like .env or .ruby-version
let g:ctrlp_show_hidden = 1

" Automatically jump to tag if there is only one result
let g:ctrlp_tjump_only_silent = 1

" The Silver Searcher - https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag instead of grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use Ag in CtrlP for listing files since it's faster and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l -g ""'

  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
