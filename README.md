# [![Sean Huber](https://cloud.githubusercontent.com/assets/2419/6550752/832d9a64-c5ea-11e4-9717-6f9aa6e023b5.png)](https://github.com/shuber) dotfiles

My pride and joy, my home

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
* [iTerm2](https://www.iterm2.com/) the terminal emulator for osx that does amazing things

## Git

* aliases
* configs
* hub (github)
* ignores

## Heroku

* config/integration
* multiple accounts
* aliases

## Homebrew

* list different packages

## iTerm2

* theme/colors/settings
* slightly transparent full screen mode in all spaces with hotkey

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

## SSH

* list non-standard configs

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

* list custom configs and plugins
