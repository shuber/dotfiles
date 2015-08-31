" Use vim settings instead of vi settings
set nocompatible

" Temporarily turn filetype off for vundle
filetype off

" Initialize vundle plugin manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Configure plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/ctags.vim'
Plugin 'bling/vim-airline'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plugin 'danro/rename.vim'
Plugin 'danchoi/ri.vim'
Plugin 'depuracao/vim-rdoc'
Plugin 'edkolev/promptline.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'junegunn/fzf'
Plugin 'elixir-lang/vim-elixir'
Plugin 'evanmiller/nginx-vim-syntax'
Plugin 'fatih/vim-go'
Plugin 'jaxbot/semantic-highlight.vim'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-user'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'ivalkeen/vim-ctrlp-tjump'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/webapi-vim'
Plugin 'mxw/vim-jsx'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'rizzatti/dash.vim'
Plugin 'rking/ag.vim'
Plugin 'slim-template/vim-slim'
Plugin 'suan/vim-instant-markdown'
Plugin 'scrooloose/syntastic'
Plugin 'szw/vim-tags'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/dbext.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/tComment'

" Git
Plugin 'mattn/gist-vim'
Plugin 'wting/gitsessions.vim'
Plugin 'int3/vim-extradite'
Plugin 'tpope/vim-fugitive'

" Tmux
Plugin 'keith/tmux.vim'
Plugin 'edkolev/tmuxline.vim'
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
