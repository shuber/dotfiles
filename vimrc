"===============================================================================
" Initialization
"===============================================================================

" Use Vim settings instead of Vi settings
set nocompatible

"===============================================================================
" Plugins
"===============================================================================

" Load vundle to manage plugins
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Set airline (status bar) theme and enable powerline fonts
let g:airline_theme="bubblegum"
let g:airline_powerline_fonts=1

" Disable tmuxline auto-theme generation since I've made changes to it
let g:airline#extensions#tmuxline#enabled = 0

" Custom ignore patterns for the ctrl-p plugin
let g:ctrlp_custom_ignore = '\v[\/]((\.(git|hg|svn))|(public\/(system|uploads))|tmp|vendor/bundle)$'

" Allow ctrl-p to show hidden files like .env or .ruby-version
let g:ctrlp_show_hidden = 1

" Let ctrl-p manage tag navigation
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>

" Automatically jump to tag if there is only one result
let g:ctrlp_tjump_only_silent = 1

" The Silver Searcher - https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag instead of grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use Ag in CtrlP for listing files since it's faster and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l -g ""'

  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Thoughtbot's rspec integration
let g:rspec_command = "compiler rspec | set makeprg=spring | Make rspec {spec}"

" syntastic
let g:syntastic_ruby_exec = '~/.rbenv/shims/ruby'
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-","<ion-", "</ion-"]

" Gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1

" Don't autogenerate ctags
let g:vim_tags_auto_generate = 0

"===============================================================================
" Color scheme
"===============================================================================

" Load a colorscheme from plugins
colorscheme Tomorrow-Night

" Setting highlight colors for diff mode doesn't seem work since vimdiff overwrites
" these values when it loads. As a workaround we'll just define the highlight rules
" with an autocmd that fires after vimdiff is already loaded
augroup diff
  autocmd!
  autocmd FilterWritePost *
    \ if &diff |
    \   hi diffAdded ctermfg=2 |
    \   hi diffNewFile ctermfg=3 |
    \   hi diffRemoved ctermfg=1 |
    \   hi gitcommitDiff ctermfg=244 |
    \   hi DiffChange ctermbg=235 |
    \   hi DiffDelete ctermbg=234 ctermfg=234 |
    \   hi DiffAdd ctermbg=235 |
    \   hi DiffText ctermbg=237 |
    \ endif
augroup END

hi diffAdded ctermfg=2
hi diffNewFile ctermfg=3
hi diffRemoved ctermfg=1
hi gitcommitDiff ctermfg=244

hi clear CursorLineNR
hi CursorLineNR ctermbg=240 ctermfg=3

"===============================================================================
" Syntax highlighting
"===============================================================================

augroup filetypes
  autocmd!
  autocmd BufNewFile,BufRead .env* set filetype=sh
  autocmd BufNewFile,BufRead Dockerfile set filetype=dockerfile
  autocmd BufNewFile,BufRead *.msx let b:jsx_ext_found = 1
  autocmd BufNewFile,BufRead *.msx set filetype=javascript
  autocmd BufNewFile,BufRead *.arb set filetype=ruby
  autocmd BufNewFile,BufRead *.tmux set filetype=tmux
augroup END

" List all syntax highlighting groups that include the item under the cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
  \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
  \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"===============================================================================
" Settings
"===============================================================================

" Enable 256 color mode
set t_Co=256

" Don't use backups or swapfiles (just save frequently)
set nobackup
set nowritebackup
set noswapfile

" Use soft tabs with two spaces
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Split panes to the right or below which feels more natural
set splitright
set splitbelow

" Use both relative and absolute line numbering
set relativenumber
set number

" Increase history storage
set history=100000

" UTF-8 Encoding
set encoding=utf-8
scriptencoding utf-8

" Automatically :write before running commands
set autowrite

" Read/write a file with encryption using `vim -x filename.ext`
set cryptmethod=blowfish

" Set the path to lookup tags
set tags=tags

" fzf - fuzzy file finder
" set rtp+=~/.fzf
set rtp+=/usr/local/Cellar/fzf/0.10.2

" Vertically split the diff window
let g:extradite_diff_split = 'vert split'

" Vertically split the dbext window
let g:dbext_default_window_use_horiz = 0

"===============================================================================
" Functions
"===============================================================================

function! s:GetBufferList()
  redir => buflist
  silent! ls
  redir END
  return buflist
endfunction

" Toggle the quickfix window (:copen and :cclose)
function! ToggleQuickfixList()
  for bufnum in map(filter(split(s:GetBufferList(), '\n'), 'v:val =~ "Quickfix List"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      cclose
      return
    endif
  endfor
  let winnr = winnr()
  if exists("g:toggle_list_copen_command")
    exec(g:toggle_list_copen_command)
  else
    copen
  endif
  if winnr() != winnr
    wincmd p
  endif
endfunction

"===============================================================================
" Leader Mappings
"===============================================================================

" Use a single space as the mapleader
let mapleader=" "

" Copy line or highlighted contents to system clipboard
nmap <Leader>y V<Leader>y
vmap <Leader>y mm"+y<cr>`m

" Enable paste mode, paste from system clipboard, then disable paste mode
nmap <Leader>p mm:set paste<cr>"+p`mJx

" Async commands using vim-dispatch
nmap <Leader>d :Dispatch<cr>:e<cr>

" Tmux
function! s:tmux_refresh()
  silent! execute '!tmux refresh-client -S'
  redraw!
endfunction

command! -nargs=0 TmuxRefresh :call <sid>tmux_refresh(<f-args>)

" Git mappings
vmap <Leader>gb :Gblame<cr>
nmap <Leader>gd :Gdiff<cr>
nmap <Leader>gh :Extradite<cr>
nmap <Leader>gl :Gbrowse<cr>
vmap <Leader>gl :Gbrowse<cr>
nmap <Leader>gu :Dispatch git pull<cr>
nmap <Leader>gp :Dispatch git push<cr>
nmap <Leader>gs :Gstatus<cr>
nmap <Leader>gw :Gwrite<cr>
nmap <Leader>ge :Extradite<cr>
nmap <leader>gss :GitSessionSave<cr>
nmap <leader>gsl :GitSessionLoad<cr>
nmap <leader>gsd :GitSessionDelete<cr>

function! s:git_checkout(unsanitized_branch)
  let branch = substitute(a:unsanitized_branch, '^\s*\(.\{-}\)\s*$', '\1', '')
  let checkout = 'git checkout '
  let checkout_old = checkout.branch
  let checkout_new = checkout.'-b '.branch
  let checkout_command = '!'.checkout_old.' || '.checkout_new
  silent! execute checkout_command
endfunction

command! -nargs=1 Gcheckout :call <sid>git_checkout(<f-args>)

function! s:git_branch(...)
  if a:0 > 0
    execute 'Gcheckout ' . a:1
    execute 'TmuxRefresh'
  else
    call fzf#run({'source': 'git branch -a', 'sink': function('s:git_branch')})
  endif
endfunction

command! -nargs=? Gbranch :call <sid>git_branch(<f-args>)

nmap <leader>gb :Gbranch<cr>
nmap <leader>gg :Gbranch -<cr>

" Edit a file in the current directory
nmap <Leader>e :e <C-r>=expand('%:h').'/'<cr>

" Easily switch between the last two files
nmap <Leader><Leader> <C-^>

" Run rspec tests
nmap <Leader>t :call RunCurrentSpecFile()<cr>
nmap <Leader>s :call RunNearestSpec()<cr>
nmap <Leader>l :call RunLastSpec()<cr>
nmap <Leader>a :call RunAllSpecs()<cr>

" Open a rails console
nmap <Leader>c :Dispatch spring rails console<cr>

" Toggle the quickfix window
nmap <script> <silent> <Leader>q :call ToggleQuickfixList()<cr>:e<cr>

" FZF search/completion
nmap <leader>f :FZF<cr>

" SQL
nmap <Leader>see vae<leader>se<c-o><c-w>=zz
nmap <Leader>sc :!bin/compile development<cr>:e development.sql<cr>vae<leader>se<c-o><c-o><c-w>=zz
nmap <Leader>se :DBExecSQLUnderCursor<cr>
vmap <Leader>se :DBExecVisualSQL<cr>
nmap <Leader>w :vertical resize 300<cr>

"===============================================================================
" Command mode mappings
"===============================================================================

" Save unwriteable files with sudo
cmap w!! w !sudo tee > /dev/null %

" Expand the current file path in command mode with %%
cmap %% <c-r>=expand('%:p')<cr>

"===============================================================================
" Normal mode mappings
"===============================================================================

" Don't require <Shift> when entering command mode
nnoremap ; :

" Use <C-s> to save
nmap <C-s> :w<cr>

" Easily edit configuration files
nmap ,bash :e $HOME/.bashrc<cr>
nmap ,bun :e $HOME/.vimrc.bundles<cr>
nmap ,gem :e $HOME/.gemrc<cr>
nmap ,tmux :e $HOME/.tmux.conf<cr>
nmap ,vim :e $HOME/.vimrc<cr>
nmap ,zsh :e $HOME/.zshrc<cr>

" Generate ctags
nmap ,tags :!ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)<cr>

" Create splits, vertical splits, and tabs
nmap \s :new<cr>
nmap \v :vnew<cr>
nmap \t :tabnew<cr>

" Close the quickfix window
nmap \q :cclose<cr>

" Source .vimrc
nmap \r :source ~/.vimrc<cr>

" Toggle cursorline and cursorcolumn
nmap \c :set cursorline!<cr>:set cursorcolumn!<cr>

" Toggle search highlighting
nmap \h :set hlsearch!<cr>

" Navigate splits panes
nmap <C-j> <C-w>w
nmap <C-k> <C-w>W

" Navigate tabs
nmap <C-h> :tabprev<cr>
nmap <C-l> :tabnext<cr>

" Yank to the end of the line
nmap Y y$

nmap <leader>el :RExtractLet<cr>

"===============================================================================
" Visual mode mappings
"===============================================================================

" Make <C-c> behave the same as <esc> in visual block mode
vmap <C-c> <esc>

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"===============================================================================
" Configuration overrides
"===============================================================================

" Source additional files under .vim/overrides (.vim/plugin is loaded earlier)
if isdirectory(expand("~/.vim/overrides"))
  runtime! ~/.vim/overrides/*.vim
endif

" Load .vimrc.local last for system specific overrides
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
