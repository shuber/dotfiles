# These commands for thoughtbot's parity were taken from the
# Heroku tips and tricks upcase video.
# https://upcase.com/videos/heroku-tips-and-tricks

copy-production-to() {
  if [ "$1" != "staging" ] && [ "$1" != "development" ]; then
    echo >&2 "Usage: copy-production-to <staging|development>"
    return 1
  else
    production backup && "$1" restore production
  fi
}

# Provide tab completion of either "staging" or "development"
_copy-production-to() { reply=(development staging) }
compctl -K _copy-production-to copy-production-to
