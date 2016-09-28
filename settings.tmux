#!/usr/bin/env bash
# author:    liangguohuan <liangguohuan@gmail.com>
# modified:  2016 Sep 28
# manual: 
# - command trigger: c-a [ bind command ]

#-- tmux mark for vim --#
# I use this mark to check vim is working in tmux.
is_tmux=1


#-- base --#
set -g default-terminal "xterm-256color"
setw -g xterm-keys on
set -g display-time 3000
set -g history-limit 65535
set -g base-index 1
set -g pane-base-index 2
set -s escape-time 0
set -g focus-events on

#-- mouse --#
set -g mouse-resize-pane on
set -g mouse-select-pane on
set -g mouse-select-window on
set -g mouse-utf8 on
setw -g mode-mouse on

#-- bindkeys --#
set -g prefix ^a
unbind ^b
bind a send-prefix

unbind '"'
bind - splitw -v
unbind %
bind | splitw -h

bind k selectp -U
bind j selectp -D
bind h selectp -L
bind l selectp -R

bind ^k resizep -U 10
bind ^j resizep -D 10
bind ^h resizep -L 11
bind ^l resizep -R 10

bind -r "<" swap-window -t -1
bind -r ">" swap-window -t +1

bind ^e last
bind q killp
bind a displayp

bind '~' splitw htop
bind m command-prompt "splitw -h 'exec man %%'"

bind C-c run "tmux save-buffer - | xsel -ib" \; display "Copied tmux buffer to system clipboard"
bind C-v run "tmux set-buffer \"$(xsel -ob)\"; tmux paste-buffer"
bind F4 run "tmux kill-server"# }}}

bind r source-file ~/.tmux.conf \; display "Reloaded!"

