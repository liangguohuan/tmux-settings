#!/usr/bin/env bash
# author:    liangguohuan <liangguohuan@gmail.com>
# modified:  2016 Sep 28
# manual: 
# - command trigger: c-a [ tmux bind-key command ]

#-- base --#
tmux set -g default-terminal "screen-256color"
tmux set -ga terminal-overrides ",screen-256color:Tc"
tmux setw -g xterm-keys on
tmux set -g display-time 3000
tmux set -g history-limit 65535
tmux set -g base-index 1
tmux set -g pane-base-index 1
tmux set -s escape-time 0
tmux set -g focus-events on
tmux set -g status
tmux set -g status-position top

#-- mouse --#
tmux set -g mouse-resize-pane on
tmux set -g mouse-select-pane on
tmux set -g mouse-select-window on
tmux set -g mouse-utf8 on
tmux setw -g mode-mouse on

#-- tmux bind-keykeys --#
tmux set -g prefix F6
tmux unbind ^b
tmux bind-key a send-prefix

tmux unbind '"'
tmux bind-key - splitw -v -c "#{pane_current_path}"
tmux unbind %
tmux bind-key \| splitw -h -c "#{pane_current_path}"

tmux bind-key k resizep -U 10
tmux bind-key j resizep -D 10
tmux bind-key h resizep -L 10
tmux bind-key l resizep -R 10

# switch windows alt+number
tmux bind-key -n C-1 select-window -t 1
tmux bind-key -n C-2 select-window -t 2
tmux bind-key -n C-3 select-window -t 3
tmux bind-key -n C-4 select-window -t 4
tmux bind-key -n C-5 select-window -t 5
tmux bind-key -n C-6 select-window -t 6
tmux bind-key -n C-7 select-window -t 7
tmux bind-key -n C-8 select-window -t 8
tmux bind-key -n C-9 select-window -l
tmux bind-key -n C-0 run-shell "tmux-run-shell lastwindow"

tmux bind-key -r "<" swap-window -t -1
tmux bind-key -r ">" swap-window -t +1

tmux bind-key e last
tmux bind-key x killp
tmux bind-key b set status
tmux bind-key o kill-pane -a

# replace default key list showing
tmux bind-key ? run 'tmux splitw "tmux-run-shell getkeylist" \; resizep -Z'
# replace default window list showing
tmux bind-key w run 'tmux splitw "tmux-run-shell getwindowlist" \; resizep -Z'
# replace default session list showing
tmux bind-key s run 'tmux splitw "tmux-run-shell getsessionlist" \; resizep -Z'

tmux bind-key H run 'tmux splitw "htop" \; resizep -Z'
tmux bind-key M command-prompt "splitw -p 100 'exec vman %%'; resizep -Z"

tmux bind-key C-c run "tmux-run-shell copy" \; display "Copied tmux buffer to system clipboard"
tmux bind-key C-v run "tmux-run-shell paste"
tmux bind-key F4  run "tmux kill-server"
tmux bind-key Enter send-keys -R C-q "tmux-run-shell clear" C-m

tmux bind-key r source-file ~/.tmux.conf \; display "Reloaded!"

