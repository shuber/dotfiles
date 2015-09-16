command! -nargs=0 LoadSession :call <sid>load_session(<f-args>)
command! -nargs=0 MakeSession :call <sid>make_session(<f-args>)
command! -nargs=0 SessionFile :call <sid>session_file(<f-args>)

function! s:make_session()
  let b:session_file = s:session_file()
  exe 'mksession! ' . b:session_file
  echo 'Saved session ' b:session_file
endfunction

function! s:load_session()
  let b:session_file = s:session_file()

  if (filereadable(b:session_file))
    exec 'source ' b:session_file
  else
    execute 'MakeSession'
  endif

  echo 'Loaded session ' b:session_file
endfunction

function! s:session_file()
  let b:session_dir = $HOME . '/.vim/sessions'
  let b:git_branch = systemlist('git symbolic-ref --short HEAD')[0]
  let b:session_name = getcwd() . '/' . b:git_branch
  let b:session_path = substitute(b:session_name, '\W', '_', 'g') . '.vim'
  let b:session_file = b:session_dir . '/' . b:session_path

  if (filewritable(b:session_dir) != 2)
    exec 'silent !mkdir -p ' b:session_dir
    redraw!
  endif

  echo b:session_file
  return b:session_file
endfunction
