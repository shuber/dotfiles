fzf_version="0.10.2"
fzf_root="/usr/local/Cellar/fzf/$fzf_version"

if [[ ! "$PATH" =~ "$fzf_root/bin" ]]; then
  export PATH="$PATH:$fzf_root/bin"
fi

if [[ ! "$MANPATH" =~ "$fzf_root/man" && -d "$fzf_root/man" ]]; then
  export MANPATH="$MANPATH:$fzf_root/man"
fi

if [ -n "${ZSH_VERSION}" ]; then
  extension="zsh"
else
  extension="bash"
fi

[[ $- =~ i ]] && source "$fzf_root/shell/completion.$extension" 2> /dev/null
source "$fzf_root/shell/key-bindings.$extension"
