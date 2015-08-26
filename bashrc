# Load shared shell configs
source "$HOME/.shell/bootstrap.sh"

# Load overrides from .bashrc.local last if it exists
if [ -f "$HOME/.bashrc.local" ]; then
  source "$HOME/.bashrc.local"
fi

# added by travis gem
[ -f /Users/shuber/.travis/travis.sh ] && source /Users/shuber/.travis/travis.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
