command! -nargs=0 CtagsRuby :call <sid>ctags_ruby(<f-args>)

let g:vim_tags_auto_generate = 0
set tags=tags

function! s:ctags_ruby()
  let options = "-R --languages=ruby --exclude=.git --exclude=log"
  let paths = system("bundle list --paths")
  silent! execute "!ctags " options " . " paths
endfunction
