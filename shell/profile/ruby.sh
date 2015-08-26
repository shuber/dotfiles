if which rbenv > /dev/null; then
  if [ -n "${ZSH_VERSION}" ]; then
    eval "$(rbenv init - zsh)"
  else
    eval "$(rbenv init -)"
  fi
fi
