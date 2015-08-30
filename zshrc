# Temporarily silence "no matches found"
# warnings and load all shared configuration
unsetopt nomatch
source "$HOME/.shell/bootstrap.sh"
setopt nomatch

# Load overrides from .zshrc.local last if it exists
if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi

source /usr/local/share/zsh/site-functions/git-completion.bash
