# This tmux statusbar config was created by tmuxline.vim
# on Mon, 24 Feb 2014

set -g status-bg "colour237"
set -g message-command-fg "colour249"
set -g message-command-bg "colour237"
set -g status-justify "left"
set -g status-left-length "100"
set -g status "on"
set -g pane-active-border-fg "colour150"
set -g message-bg "colour237"
set -g status-right-length "100"
set -g status-right-attr "none"
set -g message-fg "colour249"
set -g status-attr "none"
set -g status-utf8 "on"
set -g pane-border-fg "colour237"
set -g status-left-attr "none"
setw -g window-status-fg "colour150"
setw -g window-status-attr "none"
setw -g window-status-activity-bg "colour237"
setw -g window-status-activity-attr "none"
setw -g window-status-activity-fg "colour150"
setw -g window-status-separator ""
setw -g window-status-bg "colour238"
set -g status-left "#[fg=colour236,bg=colour150] #h  #S #[fg=colour150,bg=colour237,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=colour249,bg=colour237] %Y-%m-%d  %I:%M #[fg=colour150,bg=colour237,nobold,nounderscore,noitalics]#[fg=colour236,bg=colour150] #{git_branch} #()"
setw -g window-status-format "#[fg=colour249,bg=colour237] #I #[fg=colour249,bg=colour237] #W "
setw -g window-status-current-format "#[fg=colour238,bg=colour150,nobold,nounderscore,noitalics]#[fg=colour236,bg=colour150] #I #[fg=colour236,bg=colour150] #W #[fg=colour150,bg=colour237,nobold,nounderscore,noitalics]"



# set -g status-right '#[fg=colour150,bg=colour237,nobold,nounderscore,noitalics]#[fg=colour236,bg=colour150] #W #[fg=colour236,bg=colour150] #I #[fg=colour237,bg=colour150,nobold,nounderscore,noitalics]#[fg=colour249,bg=colour237] %Y-%m-%d  %I:%M #[fg=colour150,bg=colour237,nobold,nounderscore,noitalics]#[fg=colour236,bg=colour150] #{git_branch} '

# only red and green
# set -g status-right "#[fg=colour249,bg=colour237] %Y-%m-%d  %I:%M #[fg=colour4,bg=colour237,nobold,nounderscore,noitalics]#[fg=colour150,bg=colour237,nobold,nounderscore,noitalics]#[fg=colour236,bg=colour150] 18 #[fg=colour236,bg=colour150] + #[fg=colour237,bg=colour150,nobold,nounderscore,noitalics]#[fg=colour131,bg=colour237,nobold,nounderscore,noitalics]#[fg=colour236,bg=colour131] 37 #[fg=colour236,bg=colour131] - #[fg=colour237,bg=colour131,nobold,nounderscore,noitalics]#[fg=colour3,bg=colour237,nobold,nounderscore,noitalics]#[fg=colour236,bg=colour3] #{git_branch}#[fg=colour3,bg=colour3]"

# red green and blue
# set -g status-right "#[fg=colour249,bg=colour237] %Y-%m-%d  %I:%M #[fg=colour4,bg=colour237,nobold,nounderscore,noitalics]#[fg=colour236,bg=colour4] 6 #[fg=colour236,bg=colour4] ± #[fg=colour237,bg=colour4,nobold,nounderscore,noitalics]#[fg=colour150,bg=colour237,nobold,nounderscore,noitalics]#[fg=colour236,bg=colour150] 18 #[fg=colour236,bg=colour150] + #[fg=colour237,bg=colour150,nobold,nounderscore,noitalics]#[fg=colour131,bg=colour237,nobold,nounderscore,noitalics]#[fg=colour236,bg=colour131] 37 #[fg=colour236,bg=colour131] - #[fg=colour237,bg=colour131,nobold,nounderscore,noitalics]#[fg=colour3,bg=colour237,nobold,nounderscore,noitalics]#[fg=colour236,bg=colour3] #{git_branch}#[fg=colour3,bg=colour3]"
