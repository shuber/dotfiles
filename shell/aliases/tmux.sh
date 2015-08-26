alias t="tmux"
alias ts="tmux new -s"
alias tt="tmux at -t"

alias edit-tmux-conf="$EDITOR $HOME/.tmux.conf"
alias edit-tmux-local-conf="$EDITOR $HOME/.tmux.local.conf"
alias edit-tmux-theme="$EDITOR $HOME/.tmux.theme.conf"
alias reload-tmux="tmux source-file $HOME/.tmux.conf"

if [[ "$OSTYPE" == "darwin"* ]]; then
  alias tmux="reattach-to-user-namespace tmux"
fi
