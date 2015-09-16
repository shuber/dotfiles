set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,options,resize,tabpages,winsize,winpos

command! -nargs=0 LoadSession :call LoadSession(<f-args>)
command! -nargs=0 MakeSession :call MakeSession(<f-args>)
command! -nargs=0 SessionFile :echom SessionFile(<f-args>)

function! MakeSession()
  let b:session_file = SessionFile()
  exe 'mksession! ' . b:session_file
  echo 'Saved session ' b:session_file
endfunction

function! LoadSession()
  let b:session_file = SessionFile()

  if (filereadable(b:session_file))
    exec 'source ' b:session_file
  else
    execute 'MakeSession'
  endif

  echo 'Loaded session ' b:session_file
endfunction

function! SessionFile()
  let b:session_dir = $HOME . '/.vim/sessions'
  let b:git_branch = systemlist('git symbolic-ref --short HEAD')[0]
  let b:session_name = getcwd() . '/' . b:git_branch
  let b:session_path = substitute(b:session_name, '\W', '_', 'g') . '.vim'
  let b:session_file = b:session_dir . '/' . b:session_path

  if (filewritable(b:session_dir) != 2)
    exec 'silent !mkdir -p ' b:session_dir
    redraw!
  endif

  return b:session_file
endfunction
