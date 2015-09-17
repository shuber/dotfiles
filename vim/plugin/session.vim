" set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,options,resize,tabpages,winsize,winpos

set undolevels=1000
set undoreload=10000

command! -nargs=0 LoadSession :call LoadSession(<f-args>)
command! -nargs=0 MakeSession :call MakeSession(<f-args>)
command! -nargs=0 SessionFile :echom SessionFile(<f-args>)

function! MakeSession()
  let l:session_file = SessionFile()
  call MakeUndoSession()
  exe 'mksession! ' . l:session_file
  echo 'Saved session ' l:session_file
endfunction

function! MakeUndoSession()
  let l:session_file = SessionFile()
  let l:undo_dir = substitute(l:session_file, '\W', '_', 'g')
  let l:undo_path = $HOME . '/.vim/undo/' . l:undo_dir

  if (filewritable(l:undo_path) != 2)
    exec 'silent !mkdir -p ' l:undo_path
    redraw!
  endif

  let &undodir = l:undo_path
  set undofile
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
