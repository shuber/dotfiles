# https://github.com/zsh-users/antigen plugin manager
if [ -n "${ZSH_VERSION}" ]; then
  source $(dirname $0)/antigen/antigen.zsh

  # antigen bundle unixorn/git-extra-commands
  # antigen bundle zsh-users/zsh-syntax-highlighting

  antigen apply
fi
