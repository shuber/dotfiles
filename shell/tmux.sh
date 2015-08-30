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

# Renames the current tmux window to the hostname of the remote host
ssh() {
  # Do nothing if we are not inside tmux or ssh is called without arguments
  if [[ $# == 0 || -z $TMUX ]]; then
    command ssh $@
    return
  fi

  # The hostname is the last parameter (i.e. ${(P)#})
  local remote=${${(P)#}%.*}
  local old_name="$(tmux display-message -p '#W')"
  local renamed=0

  # Save the current name
  if [[ $remote != -* ]]; then
    renamed=1
    tmux rename-window $remote
  fi

  # Execute the ssh command
  command ssh $@

  if [[ $renamed == 1 ]]; then
    tmux rename-window "$old_name"
  fi
}
