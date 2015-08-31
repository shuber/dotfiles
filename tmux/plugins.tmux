# Tmux Plugin Manager
# https://github.com/tmux-plugins/tpm
#
# prefix + I: install plugins
# prefix + U: update plugins
# prefix + alt + u: uninstall plugins

set -g @plugin "tmux-plugins/tmux-sensible"
set -g @plugin "tmux-plugins/tmux-resurrect"
set -g @plugin "tmux-plugins/tmux-continuum"
set -g @plugin "shuber/tmux-git"

set -g @resurrect-save "S"
set -g @resurrect-restore "R"

run "~/.tmux/plugins/tpm/tpm"
