#!/usr/bin/env bash
# author:    liangguohuan <liangguohuan@gmail.com>
# modified:  2016 Sep 28
# manual: 
# - command trigger: c-a [ tmux bind-key command ]

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

#-- tmux bind-keykeys --#
set -g prefix ^a
untmux bind-key ^b
tmux bind-key a send-prefix

untmux bind-key '"'
tmux bind-key - splitw -v
untmux bind-key %
tmux bind-key | splitw -h

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
tmux bind-key q killp
tmux bind-key a displayp

tmux bind-key '~' splitw htop
tmux bind-key m command-prompt "splitw -h 'exec man %%'"

tmux bind-key C-c run "tmux save-buffer - | xsel -ib" \; display "Copied tmux buffer to system clipboard"
tmux bind-key C-v run "tmux set-buffer \"$(xsel -ob)\"; tmux paste-buffer"
tmux bind-key F4 run "tmux kill-server"

tmux bind-key r source-file ~/.tmux.conf \; display "Reloaded!"

