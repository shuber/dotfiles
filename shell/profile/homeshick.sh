# Setup homeshick for managing dotfiles
if [ -d "$HOME/.homesick/repos/homeshick" ]; then
  source "$HOME/.homesick/repos/homeshick/homeshick.sh"

  if [ -n "${ZSH_VERSION}" ]; then
    nfpath=($HOME/.homesick/repos/homeshick/completions $fpath)
  else
    source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"
  fi
fi
