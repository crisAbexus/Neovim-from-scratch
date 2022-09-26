#!/usr/bin/env bash

reldir="$( dirname -- "$0";)";
cd "$reldir";
directory="$( pwd )";

cd "${directory}";
tmux kill-session -t dotfiles;
tmux has-session -t dotfiles;

tmux new -s dotfiles -n nvim -d;
tmux send-key -t nvim "nvim ." C-m;

tmux new-window -n lazygit
tmux send-key -t lazygit "lazygit" C-m;

tmux attach -t dotfiles;
