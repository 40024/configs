#!/bin/bash
tmux new-session -d -s Organization -n zsh -c ~/Documents/_Organization
tmux new-window -t Organization -n llm -c ~/Documents/_Organization
tmux send-keys -t Organization 'claude' Enter

tmux new-session -d -s Dashboard -n webserver -c ~/Dev/Dashboard
tmux send-keys -t Dashboard 'source ~/Dev/Dashboard/venv/bin/activate && cd website && python3 manage.py runserver' Enter
tmux new-window -t Dashboard -n zsh -c ~/Dev/Dashboard

tmux a -t Organization
