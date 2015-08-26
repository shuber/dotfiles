# Temporarily silence "no matches found" warnings
unsetopt nomatch

# Load shared shell configs
source "$HOME/.shell/bootstrap.sh"

# Re-enable "no matches found" warnings
setopt nomatch

# Load overrides from .zshrc.local last if it exists
if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi

# added by travis gem
[ -f /Users/shuber/.travis/travis.sh ] && source /Users/shuber/.travis/travis.sh

source /usr/local/share/zsh/site-functions/git-completion.bash
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
