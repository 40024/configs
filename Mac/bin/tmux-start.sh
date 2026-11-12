#!/bin/bash
tmux new-session -d -s Organization -n zsh -c ~/Documents/_Organization
tmux new-window -t Organization -n llm -c ~/Documents/_Organization
tmux send-keys -t Organization 'ooo' Enter
tmux new-window -t Organization -n radar -c ~/Documents/_Organization
tmux send-keys -t Organization 'ra --inbox --mine | n -' Enter
tmux new-window -t Organization -n explorer -c ~/Documents/_Organization
tmux send-keys -t Organization 'yazi' Enter

tmux new-session -d -s Dashboardd -n webserver -c ~/Dev/Dashboard
tmux send-keys -t Dashboardd 'source ~/Dev/Dashboard/venv/bin/activate && cd website && python3 manage.py runserver' Enter
tmux new-window -t Dashboardd -n zsh -c ~/Dev/Dashboard
tmux send-keys -t Dashboardd 'source ~/Dev/Dashboard/venv/bin/activate && cd website' Enter

tmux a -t Organization
