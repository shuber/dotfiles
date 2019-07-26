# Load shared shell configs
source "$HOME/.shell/bootstrap.sh"

# Load overrides from .bashrc.local last if it exists
if [ -f "$HOME/.bashrc.local" ]; then
  source "$HOME/.bashrc.local"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
