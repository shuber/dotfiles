fzf_version="0.10.2"
fzf_root="/usr/local/Cellar/fzf/$fzf_version"

if [[ ! "$PATH" =~ "$fzf_root/bin" ]]; then
  export PATH="$PATH:$fzf_root/bin"
fi

if [[ ! "$MANPATH" =~ "$fzf_root/man" && -d "$fzf_root/man" ]]; then
  export MANPATH="$MANPATH:$fzf_root/man"
fi

# Use Ag instead of find to filter results
export FZF_DEFAULT_COMMAND='ag -l -g ""'

# Use Ag for CTRL-T searches as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

if [ -n "${ZSH_VERSION}" ]; then
  extension="zsh"
else
  extension="bash"
fi

[[ $- =~ i ]] && source "$fzf_root/shell/completion.$extension" 2> /dev/null
source "$fzf_root/shell/key-bindings.$extension"
