nmap <leader>ga :Gamend<cr>
nmap <leader>gb :Gbranch<cr>
vmap <Leader>gb :Gblame<cr>
nmap <Leader>gd :Gdiff<cr>
nmap <Leader>ge :Extradite<cr>
nmap <leader>gg :Gbranch -<cr>
nmap <Leader>gh :Extradite<cr>
nmap <Leader>gl :Gbrowse<cr>
vmap <Leader>gl :Gbrowse<cr>
nmap <Leader>gu :Gpull<cr>
nmap <Leader>gp :Gpush<cr>
nmap <Leader>gs :Gstatus<cr>
nmap <Leader>gw :Gwrite<cr>
nmap <leader>gsd :GitSessionDelete<cr>
nmap <leader>gsl :GitSessionLoad<cr>
nmap <leader>gss :GitSessionSave<cr>
nmap <leader>gww :Gwip<cr>
nmap <leader>gwp :GwipPop<cr>

command! -nargs=0 Gamend :call <sid>git_commit_amend(<f-args>)
command! -nargs=? Gbranch :call <sid>git_branch(<f-args>)
command! -nargs=1 Gcheckout :call <sid>git_checkout(<f-args>)
command! -nargs=? Gwip :call <sid>git_commit_wip(<f-args>)
command! -nargs=0 GwipPop :call <sid>git_commit_wip_pop(<f-args>)

function! s:git_branch(...)
  if a:0 > 0
    execute 'Gcheckout ' . a:1
    execute 'TmuxRefresh'
  else
    call fzf#run({'source': 'git branch -a', 'sink': function('s:git_branch')})
  endif
endfunction

function! s:git_checkout(unsanitized_branch)
  let branch = substitute(a:unsanitized_branch, '^\s*\(.\{-}\)\s*$', '\1', '')
  let checkout = 'git checkout '
  let checkout_old = checkout.branch
  let checkout_new = checkout.'-b '.branch
  let checkout_command = '!'.checkout_old.' || '.checkout_new
  silent! execute checkout_command
endfunction

function! s:git_commit_amend()
  silent! execute 'Git add .'
  silent! execute 'Git commit --amend'
  redraw!
endfunction

function! s:git_commit_wip(...)
  if a:0 > 0
    let message = '[WIP] '.a:1
  else
    let message = '[WIP]'
  endif

  let commit = 'Git commit -am '.shellescape(message)

  silent! execute 'Git add .'
  silent! execute commit
  redraw!

  echo message
endfunction

function! s:git_commit_wip_pop()
  let commit = systemlist('git log -1 --oneline')[0]

  if commit =~ '\[WIP\]'
    silent! execute 'Git reset --soft HEAD~1'
    redraw!
    echo 'Soft reset: '.commit
  else
    echo 'No WIP found: '.commit
  endif
endfunction
