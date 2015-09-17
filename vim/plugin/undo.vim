" Max number of changes that can be undone
set undolevels=1000

" Max number of lines to save for undo on a buffer reload
set undoreload=10000

function! MakeUndoSession()
  let b:session_file = SessionFile()
  let b:undo_dir = substitute(b:session_file, '\W', '_', 'g')
  let b:undo_path = $HOME . '.vim/undo/' . b:undo_dir

  call system('mkdir -p ' . b:undo_path)
  let &undodir = b:undo_path
  set undofile
endfunction

call MakeUndoSession()
