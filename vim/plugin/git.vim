nmap <leader>gam :Gamend<cr>
nmap <leader>gaa :Gadd<cr>:Gcommit --amend --no-edit<cr>:TmuxRefresh<cr>
nmap <leader>gb :Promiscuous<cr>:TmuxRefresh<cr>
nmap <leader>gc :Gcommit -v<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>ge :Extradite<cr>
nmap <leader>gfp :Gpush --force-with-lease<cr>:TmuxRefresh<cr>
nmap <leader>gg :Promiscuous -<cr>:TmuxRefresh<cr>
nmap <leader>gh :Git pull-request<cr>
nmap <leader>gl :Gbrowse<cr>
nmap <leader>gu :Dispatch git pull && tmux refresh-client -S<cr>
nmap <leader>gp :Dispatch git push && tmux refresh-client -S<cr>
nmap <leader>gs :Gstatus<cr>
nmap <leader>gw :Gwrite<cr>
nmap <leader>gww :Gwip<cr>
nmap <leader>gwp :GwipPop<cr>

vmap <leader>gb :Gblame<cr>
vmap <leader>gl :Gbrowse<cr>

command! -nargs=? Gadd :call <sid>git_add(<f-args>)
command! -nargs=0 Gamend :call <sid>git_commit_amend(<f-args>)
command! -nargs=? Gwip :call <sid>git_commit_wip(<f-args>)
command! -nargs=0 GwipPop :call <sid>git_commit_wip_pop(<f-args>)

function! s:git_add(...)
  let path = a:0 > 0 ? a:1 : '.'
  silent! execute 'Git add ' path
  redraw!
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
    echom 'Soft reset: ' . commit
  else
    echom 'No WIP found: ' . commit
  endif
endfunction
