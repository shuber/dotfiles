# Load shared shell configs
source "$HOME/.shell/bootstrap.sh"

# Load overrides from .bashrc.local last if it exists
if [ -f "$HOME/.bashrc.local" ]; then
  source "$HOME/.bashrc.local"
fi
