if command -v rbenv >/dev/null 2>&1; then
  if [ -n "${ZSH_VERSION}" ]; then
    eval "$(rbenv init - zsh)"
  else
    eval "$(rbenv init -)"
  fi
fi

alias b="bundle"
alias be="bundle exec"
alias bi="bundle install --path vendor/bundle"
alias bs="bundle exec rails server"
alias bu="bundle update"
alias rdm="bundle exec rake db:migrate db:test:clone"
alias rdmm="bundle exec rake db:migrate db:rollback db:migrate db:test:clone"
alias rubo="git diff --name-only master | xargs rubocop --auto-correct"
alias s="spring"
alias v="vagrant"
