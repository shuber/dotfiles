# https://github.com/zsh-users/antigen plugin manager
if [ -n "${ZSH_VERSION}" ]; then
  source $(dirname $0)/antigen/antigen.zsh

  antigen bundle Tarrasch/zsh-autoenv

  antigen apply

  ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets pattern)
fi
