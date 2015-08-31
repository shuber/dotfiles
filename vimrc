source ~/.vim/plugins.vim
source ~/.vim/ctags.vim
source ~/.vim/ctrlp.vim
source ~/.vim/git.vim
source ~/.vim/github.vim
source ~/.vim/ruby.vim
source ~/.vim/theme.vim
source ~/.vim/tmux.vim

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
set history=10000

" UTF-8 Encoding
set encoding=utf-8
scriptencoding utf-8

" Automatically :write before running commands
set autowrite

" Read/write a file with encryption using `vim -x filename.ext`
set cryptmethod=blowfish

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

" Edit a file in the current directory
nmap <Leader>e :e <C-r>=expand('%:h').'/'<cr>

" Easily switch between the last two files
nmap <Leader><Leader> <C-^>

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
