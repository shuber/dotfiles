heroku_path="/usr/local/heroku/bin"

if [[ ! "$PATH" =~ "$heroku_path" ]]; then
  export PATH="$heroku_path:$PATH"
fi

alias h="heroku"
