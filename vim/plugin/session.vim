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
  echom 'Saved session ' l:session_file
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
  let l:session_file = SessionFile()

  if (filereadable(l:session_file))
    exec 'source ' l:session_file
  else
    execute 'MakeSession'
  endif

  echom 'Loaded session ' l:session_file
endfunction

function! SessionFile()
  let l:session_dir = $HOME . '/.vim/sessions'
  let l:git_branch = systemlist('git symbolic-ref --short HEAD')[0]
  let l:session_name = getcwd() . '/' . l:git_branch
  let l:session_path = substitute(l:session_name, '\W', '_', 'g') . '.vim'
  let l:session_file = l:session_dir . '/' . l:session_path

  if (filewritable(l:session_dir) != 2)
    exec 'silent !mkdir -p ' l:session_dir
    redraw!
  endif

  return l:session_file
endfunction
