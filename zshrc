# Temporarily silence "no matches found"
# warnings and load all shared configuration
unsetopt nomatch
source "$HOME/.shell/bootstrap.sh"
setopt nomatch

# Load overrides from .zshrc.local last if it exists
if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

setopt histignorespace
