#!/usr/bin/env bash
# author:    liangguohuan <liangguohuan@gmail.com>
# modified:  2016 Sep 28
# manual: 
# - command trigger: c-a [ tmux bind-key command ]

#-- base --#
tmux set -g default-terminal "xterm-256color"
tmux setw -g xterm-keys on
tmux set -g display-time 3000
tmux set -g history-limit 65535
tmux set -g base-index 1
tmux set -g pane-base-index 1
tmux set -s escape-time 0
tmux set -g focus-events on
tmux set -g status

#-- mouse --#
tmux set -g mouse-resize-pane on
tmux set -g mouse-select-pane on
tmux set -g mouse-select-window on
tmux set -g mouse-utf8 on
tmux setw -g mode-mouse on

#-- tmux bind-keykeys --#
tmux set -g prefix ^a
tmux unbind ^b
tmux bind-key a send-prefix

tmux unbind '"'
tmux bind-key - splitw -v
tmux unbind %
tmux bind-key \| splitw -h

tmux bind-key k selectp -U
tmux bind-key j selectp -D
tmux bind-key h selectp -L
tmux bind-key l selectp -R

tmux bind-key ^k resizep -U 10
tmux bind-key ^j resizep -D 10
tmux bind-key ^h resizep -L 11
tmux bind-key ^l resizep -R 10

tmux bind-key -r "<" swap-window -t -1
tmux bind-key -r ">" swap-window -t +1

tmux bind-key ^e last
tmux bind-key x killp
tmux bind-key ^b set -g status

tmux bind-key '~' splitw htop
tmux bind-key m command-prompt "splitw -h 'exec vim -c \"SuperMan %%\"'"

tmux bind-key C-c run "tmux save-buffer - | xsel -ib" \; display "Copied tmux buffer to system clipboard"
tmux bind-key C-v run "tmux set-buffer \"$(xsel -ob)\"; tmux paste-buffer"
tmux bind-key F4 run "tmux kill-server"
tmux bind-key Enter send-keys 'cls' C-m

tmux bind-key r source-file ~/.tmux.conf \; display "Reloaded!"

