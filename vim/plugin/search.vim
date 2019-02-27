" fzf
set rtp+=/usr/local/opt/fzf
nmap <leader>f :FZF! -x<cr>

" Let ctrl-p manage tag navigation
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>

" Custom ignore patterns for the ctrl-p plugin
let g:ctrlp_custom_ignore = '\v[\/]((\.(git|hg|svn))|(public\/(system|uploads))|tmp|vendor/bundle)$'

" Allow ctrl-p to show hidden files like .env or .ruby-version
let g:ctrlp_show_hidden = 1

" Automatically jump to tag if there is only one result
let g:ctrlp_tjump_only_silent = 1

if executable('rg') " ripgrep
  set grepprg=rg\ --vimgrep

  let g:ctrlp_user_command = 'rg %s -l -g ""'
  let g:ctrlp_use_caching = 0

  let g:rg_command = '
   \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
   \ -g "*.{js,json,jsx,php,md,styl,jade,html,config,yml,yaml,py,cpp,c,go,hs,rb,erb,haml,conf}"
   \ -g "!**/{.git,node_modules,vendor}/*"
   \ -g "!{.git,node_modules,vendor}/*" '

  command! -bang -nargs=* Rg call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

  " Search with ripgrep
  noremap <leader>s :Rg<space>
  nnoremap <leader>c :Rg<space><c-r>=expand("<cword>")<cr>
elseif executable('ag') " The Silver Searcher - https://github.com/ggreer/the_silver_searcher
  " Use Ag instead of grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use Ag in CtrlP for listing files since it's faster and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l -g ""'

  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
