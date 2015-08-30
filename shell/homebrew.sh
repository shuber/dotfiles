homebrew_path="/usr/local/bin"

if [[ ! "$PATH" =~ "$homebrew_path" ]]; then
  export PATH="$homebrew_path:$PATH"
fi
