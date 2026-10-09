#!/bin/bash
tmux new-session -d -s Organization -n zsh -c ~/Documents/_Organization
tmux new-window -t Organization -n llm -c ~/Documents/_Organization
tmux send-keys -t Organization 'claude' Enter

tmux new-session -d -s Dashboardd -n webserver -c ~/Dev/Dashboard
tmux send-keys -t Dashboardd 'source ~/Dev/Dashboard/venv/bin/activate && cd website && python3 manage.py runserver' Enter
tmux new-window -t Dashboardd -n zsh -c ~/Dev/Dashboard
tmux send-keys -t Dashboardd 'source ~/Dev/Dashboard/venv/bin/activate && cd website' Enter

tmux a -t Organization
