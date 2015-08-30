alias g="git"
alias git="hub"
alias edit-git-conf="$EDITOR $HOME/.gitconfig"
alias edit-git-ignore="$EDITOR $HOME/.gitignore"

# https://github.com/thoughtbot/suspenders/pull/282
git_safe="./.git/safe/../../bin"

if [[ ! "$PATH" =~ "$git_safe" ]]; then
  export PATH="$git_safe:$PATH"
fi
