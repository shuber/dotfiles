export NVM_DIR="$HOME/.nvm"

# Slow to load so let's just do it async
if [ -n "${ZSH_VERSION}" ]; then
  . "/usr/local/opt/nvm/nvm.sh" &!
else
  . "/usr/local/opt/nvm/nvm.sh" & disown
fi
