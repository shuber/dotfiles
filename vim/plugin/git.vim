nmap <leader>gam :Gamend<cr>
nmap <leader>gaa :Gadd<cr>:Gcommit --amend --no-edit<cr>:TmuxRefresh<cr>
nmap <leader>gb :Gbranch<cr>
nmap <leader>gc :Gcommit -v<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>ge :Extradite<cr>
nmap <leader>gfp :Gpush --force<cr>:TmuxRefresh<cr>
nmap <leader>gg :Gbranch -<cr>
nmap <leader>gh :Extradite<cr>
nmap <leader>gl :Gbrowse<cr>
nmap <leader>gu :Gpull<cr>
nmap <leader>gp :Gpush<cr>:TmuxRefresh<cr>
nmap <leader>gs :Gstatus<cr>
nmap <leader>gw :Gwrite<cr>
nmap <leader>gsd :GitSessionDelete<cr>
nmap <leader>gsl :GitSessionLoad<cr>
nmap <leader>gss :GitSessionSave<cr>
nmap <leader>gww :Gwip<cr>
nmap <leader>gwp :GwipPop<cr>

vmap <leader>gb :Gblame<cr>
vmap <leader>gl :Gbrowse<cr>

command! -nargs=? Gadd :call <sid>git_add(<f-args>)
command! -nargs=0 Gamend :call <sid>git_commit_amend(<f-args>)
command! -nargs=? Gbranch :call <sid>git_branch(<f-args>)
command! -nargs=1 Gcheckout :call <sid>git_checkout(<f-args>)
command! -nargs=0 Gstash :call <sid>git_stash(<f-args>)
command! -nargs=0 GstashApply :call <sid>git_stash_apply(<f-args>)
command! -nargs=0 GstashPop :call <sid>git_stash_pop(<f-args>)
command! -nargs=? Gwip :call <sid>git_commit_wip(<f-args>)
command! -nargs=0 GwipPop :call <sid>git_commit_wip_pop(<f-args>)

function! s:git_add(...)
  let path = a:0 > 0 ? a:1 : '.'
  silent! execute 'Git add ' path
  redraw!
endfunction

function! s:git_branch(...)
  if a:0 > 0
    let branch = split(a:1, '\n')[-1]
    " execute 'Gstash'
    " execute 'GstashApply'
    execute 'Gwip Session'
    execute 'MakeSession'
    execute 'bufdo bd'
    execute 'Gcheckout ' . branch
    execute 'LoadSession'
    execute 'GwipPop'
    " execute 'GstashPop'
    execute 'TmuxRefresh'
  else
    call fzf#run({
    \ 'options': '--print-query',
    \ 'source': 'git branch -a',
    \ 'sink': function('s:git_branch')
    \ })
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
    silent! execute 'Git reset'
    redraw!
    echo 'Soft reset: '.commit
  else
    echo 'No WIP found: '.commit
  endif
endfunction

function! s:git_stash()
  let b:stash = s:git_stash_name()
  silent! execute 'Git stash save ' . b:stash
endfunction

function! s:git_stash_apply()
  let b:reference = s:git_stash_reference()
  silent! execute 'Git stash apply ' . b:reference
endfunction

function! s:git_stash_name()
  let b:session_file = SessionFile()
  return substitute(b:session_file, '\W', '_', 'g')
endfunction

function! s:git_stash_pop()
  let b:reference = s:git_stash_reference()
  silent! execute 'Git stash apply --index ' . b:reference
  silent! execute 'Git stash drop ' . b:reference
endfunction

function! s:git_stash_reference()
  let b:stash = s:git_stash_name()
  return systemlist('git stash list | grep ' . b:stash . ' | cut -d ":" -f1')[0]
endfunction
