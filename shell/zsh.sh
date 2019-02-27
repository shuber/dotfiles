# Make sure we're in a zsh shell
if [ -n "${ZSH_VERSION}" ]; then
  export ZDOTDIR=$HOME

  # Increase history storage size and location
  HISTFILE=$HOME/.zsh_history
  HISTSIZE=100000
  SAVEHIST=100000

  # Enable colors
  autoload colors; colors

  # Setup autocompletion
  export FPATH="/usr/share/zsh/functions:/usr/local/share/zsh/site-functions:$FPATH"
  autoload -U compinit; compinit
  autoload -U promptinit; promptinit

  # Mass rename files
  autoload -U zmv

  # Allow PROMPT to interpret variables when printed
  setopt promptsubst

  # Highlight autocompletion entries when scrolling with tab
  zstyle ':completion:*' menu select

  # Add search paths to lookup when trying to cd into a directory
  setopt auto_cd
  cdpath=($HOME/Code)

  # Vi mode
  bindkey -v

  ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets pattern)
fi
