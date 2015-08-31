# [![Sean Huber](https://cloud.githubusercontent.com/assets/2419/6550752/832d9a64-c5ea-11e4-9717-6f9aa6e023b5.png)](https://github.com/shuber) dotfiles

My home, my pride and joy, a lifetime of experimentation

## Dependencies

* [homebrew](http://brew.sh/) the missing package manager for OS X
* thoughtbot's [rcm](https://github.com/thoughtbot/rcm) management suite for dotfiles

## Installation

```bash
git clone git@github.com:shuber/dotfiles.git ~/.dotfiles
~/.dotfiles/.install
```

## Editor

![Editor](https://www.dropbox.com/s/e4846hxq04a4qu9/Screenshot%202015-08-29%2014.28.59.png?dl=1)

* [Vim](http://www.vim.org/) the highly configurable text editor built to enable efficient text editing
* [Zsh](http://www.zsh.org/) a shell designed for interactive use and powerful scripting
* [Tmux](https://tmux.github.io/) an incredibly customizable and robust terminal multiplexer
* [iTerm2](https://www.iterm2.com/) the terminal emulator for OS X that does amazing things

## Git

* Global [bash alias](https://github.com/shuber/dotfiles/blob/master/shell/aliases/git.sh#L1) `g` for `git`
* Global [`~/.gitignore`](https://github.com/shuber/dotfiles/blob/master/gitignore) configuration
* Numerous [git aliases](https://github.com/shuber/dotfiles/blob/master/gitconfig#L1) e.g. `ca` for `commit -av`
* Integration with GitHub using [`hub`](https://hub.github.com/)
* [Git safe](https://github.com/thoughtbot/suspenders/pull/282) `PATH` configuration
* Colors enabled for `git` command output

![Git log](https://www.dropbox.com/s/rio9s6xa8nhacqm/Screenshot%202015-08-30%2015.13.22.png?dl=1)

![Git diff](https://www.dropbox.com/s/kckxiwc0bmahzgi/Screenshot%202015-08-30%2015.15.13.png?dl=1)

## Heroku

* config/integration - heroku toolbelt
* [multiple accounts](https://github.com/ddollar/heroku-accounts)
* aliases

## Homebrew

* [autoenv](https://github.com/kennethreitz/autoenv) for project-specific shell environments by automatically sourcing safe `.env` files
* [ctags](http://ctags.sourceforge.net/index.html) to generate an index file for searching text and language objects quickly and easily
* [curl](http://curl.haxx.se/) a command-line tool and library for transferring data with URL syntax
* [fzf](https://github.com/junegunn/fzf) a command-line fuzzy finder written in Go
* [hub](https://hub.github.com/) a command-line wrapper for git with enhanced GitHub integration
* [rbenv](https://github.com/sstephenson/rbenv) to manage multiple Ruby versions
* [rcm](https://github.com/thoughtbot/rcm) thoughtbot's management suite for dotfiles
* [readline](https://tiswww.case.edu/php/chet/readline/rltop.html) a set of functions that allow users to edit command lines as they are typed in
* [reattach-to-user-namespace](https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard) to enhance `pbcopy` and `pbpaste` integration with tmux
* [ruby-build](https://github.com/sstephenson/ruby-build) to compile and install different Ruby versions
* [the_silver_searcher](https://github.com/ggreer/the_silver_searcher) a code-searching tool similar to ack, but faster
* [tmux](https://tmux.github.io/) an incredibly customizable and robust terminal multiplexer
* [vim](http://www.vim.org/) a highly configurable text editor built to enable efficient text editing
* [zsh](http://www.zsh.org/) a shell designed for interactive use and powerful scripting

## iTerm2

* [Tomorrow night](https://github.com/shuber/dotfiles/blob/master/iterm2/Tomorrow%20Night.itermcolors) color scheme

## Ruby

* rbenv, ruby-build, auto rehash, default gems, ctags
* rdoc and ri generation with explanation of why we should generate them for global gems
* gemrc tweaks
* `bundler` config and aliases
* `irb` config
* `pry` config
* `rspec` and `parallel_tests` config
* `spring` config
* consider adding global `rubocop` config/integration
* consider adding global `guard` config/integration (livereload with transparency)

## Shell

* aliases
* status line customizations
* zsh
* fzf
* [autoenv](https://github.com/kennethreitz/autoenv) to automatically source known `.env` files

## Theme

* [Tomorrow Night](https://github.com/chriskempson/tomorrow-theme) a beautiful color scheme used everywhere
* [Bubblegum](https://github.com/bling/vim-airline/blob/master/autoload/airline/themes/bubblegum.vim) a consistent status line for everything

![Tomorrow Night](https://raw.githubusercontent.com/ChrisKempson/Tomorrow-Theme/master/Images/Tomorrow-Night-Palette.png)

```
#1d1f21 Background
#282a2e Current Line
#373b41 Selection
#c5c8c6 Foreground
#969896 Comment
#cc6666 Red
#de935f Orange
#f0c674 Yellow
#b5bd68 Green
#8abeb7 Aqua
#81a2be Blue
#b294bb Purple
```

##### [vim-airline](https://github.com/bling/vim-airline)
![Vim](https://www.dropbox.com/s/jawhcko1ztpo9yy/Screenshot%202015-08-30%2011.26.32.png?dl=1)

##### [promptline](https://github.com/edkolev/promptline.vim)
![Shell](https://www.dropbox.com/s/ct3gw516qs4bf8m/Screenshot%202015-08-30%2011.27.01.png?dl=1)

##### [tmuxline](https://github.com/edkolev/tmuxline.vim)
![Tmux](https://www.dropbox.com/s/es9ko7o4lv179xe/Screenshot%202015-08-30%2011.25.50.png?dl=1)

## Tmux

![Tmux git clean](https://www.dropbox.com/s/thuf5mkhojovols/Screenshot%202015-08-29%2013.32.30.png?dl=1)
![Tmux git dirty](https://www.dropbox.com/s/yqsgogc2olkqvqk/Screenshot%202015-08-29%2013.30.00.png?dl=1)

* Integration with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)
* [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible) for basic default settings everyone can agree on
* [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) to persist tmux environment across system restarts
* [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum) to continuously save tmux environment, automatically restore when tmux is started, and autostart tmux when system boots
* [tmux-git](https://github.com/shuber/tmux-git) to display git information in tmux status line e.g. branch name, additions, deletions, etc
* Status line customizations

## Vim

* Integration with [Vundle](https://github.com/VundleVim/Vundle.vim), the plug-in manager for Vim
* [vim-sensible](https://github.com/tpope/vim-sensible) for basic default settings everyone can agree on
* Status line customizations

## Zsh

* Integration with the [antigen](https://github.com/zsh-users/antigen) plug-in manager
* [git-extra-commands](https://github.com/unixorn/git-extra-commands)
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
* [zsh-autoenv](https://github.com/Tarrasch/zsh-autoenv) to autoload known `.autoenv.zsh` files
* list custom configs
