# Use Vim as the default editor
export EDITOR="vim"

alias vi="vim"

alias edit-vim-bundles="$EDITOR $HOME/.vimrc.bundles"
alias edit-vim-conf="$EDITOR $HOME/.vimrc"
alias edit-vim-local="$EDITOR $HOME/.vimrc.local"
alias reload-vim-bundles="$EDITOR vim +BundleInstall +qall"

if [[ "$OSTYPE" == "darwin"* ]]; then
  alias vim="reattach-to-user-namespace vim"
fi
