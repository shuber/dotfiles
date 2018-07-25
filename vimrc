"===============================================================================
" Plugins
"===============================================================================

" Use vim settings instead of vi settings
set nocompatible

" Temporarily turn filetype off for vundle
filetype off

" Initialize vundle plugin manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Development
Plugin 'shuber/vim-promiscuous'
" Plugin 'file:///Users/Sean/Code/vim/promiscuous'

" Configure plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'danro/rename.vim'
Plugin 'danchoi/ri.vim'
Plugin 'depuracao/vim-rdoc'
Plugin 'elixir-lang/vim-elixir'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-user'
Plugin 'mattn/webapi-vim'
Plugin 'rizzatti/dash.vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-eunuch'
Plugin 'xolox/vim-misc'
Plugin 'tpope/vim-rbenv'
Plugin 'xolox/vim-reload'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/dbext.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/tComment'

" Searching
Plugin 'ivalkeen/vim-ctrlp-tjump'
Plugin 'junegunn/fzf'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'rhysd/clever-f.vim'
Plugin 'rking/ag.vim'
Plugin 'szw/vim-tags'
Plugin 'vim-scripts/ctags.vim'

" Git
Plugin 'mattn/gist-vim'
Plugin 'int3/vim-extradite'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-rhubarb'

" Syntax
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'evanmiller/nginx-vim-syntax'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'jaxbot/semantic-highlight.vim'
Plugin 'scrooloose/syntastic'
Plugin 'kchmck/vim-coffee-script'
Plugin 'fatih/vim-go'
Plugin 'suan/vim-instant-markdown'
Plugin 'mxw/vim-jsx'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'slim-template/vim-slim'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'

" Theme
Plugin 'edkolev/promptline.vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
" Plugin 'bling/vim-airline'

" Tmux
Plugin 'keith/tmux.vim'
Plugin 'tmux-plugins/vim-tmux-focus-events'

" Ruby
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'jgdavey/vim-blockle'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'rorymckinley/vim-rubyhash'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'

" Load plugins
call vundle#end()

" Re-enable filetype
filetype on

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

" Increase history storage
set history=10000

" UTF-8 Encoding
set encoding=utf-8
scriptencoding utf-8

" Automatically :write before running commands
set autowrite

" Don't draw changes unless necessary
set lazyredraw
set ttyfast

" Read/write a file with encryption using `vim -x filename.ext`
set cryptmethod=blowfish

" Use zsh as the default vim shell
set shell=/usr/local/bin/zsh\ -l

" Vertically split the diff window
let g:extradite_diff_split = 'vert split'

" Vertically split the dbext window
let g:dbext_default_window_use_horiz = 0

" Disable vim instant markdown in favor of :InstantMarkdownPreview
let g:instant_markdown_autostart = 0

" Configure syntastic
let g:syntastic_javascript_checkers = ["eslint"]

" Output all Promiscuous commands for debugging
let g:promiscuous_verbose = 1

let g:gitgutter_max_signs = 1000

" Highlight current line number
hi clear CursorLineNR
hi CursorLineNR ctermbg=240 ctermfg=3

"===============================================================================
" Leader Mappings
"===============================================================================

" Use a single space as the mapleader
let mapleader=" "

" Copy line or highlighted contents to system clipboard
nmap <leader>y V<Leader>y
vmap <leader>y mm"+y<cr>`m

" Enable paste mode, paste from system clipboard, then disable paste mode
nmap <leader>p mm:set paste<cr>"+p`mJx

" Async commands using vim-dispatch
nmap <leader>d :Dispatch<cr>:e<cr>

" Edit a file in the current directory
nmap <leader>e :e <C-r>=expand('%:h').'/'<cr>

" Easily switch between the last two files
nmap <leader><leader> <C-^>

" Toggle the quickfix window
nmap <script> <silent> <leader>q :call ToggleQuickfixList()<cr>:e<cr>

" SQL
nmap <leader>see vae<leader>se<c-o><c-w>=zz
nmap <leader>sc :!bin/compile development<cr>:e development.sql<cr>vae<leader>se<c-o><c-o><c-w>=zz
nmap <leader>se :DBExecSQLUnderCursor<cr>
vmap <leader>se :DBExecVisualSQL<cr>
nmap <leader>w :vertical resize 300<cr>

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
" Reference
"===============================================================================

" g:var - global
" a:var - function argument
" l:var - local to function
" b:var - local to buffer
" w:var - local to window
" t:var - local to tab
" v:var - Predefined by Vim
