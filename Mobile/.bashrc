#  Aliases 
# Important files
alias d=
alias t=
alias ta=
alias m=
alias tr=
alias q=
alias g=
alias a=
alias s=
alias p=
# Core
alias z='cd'
alias l='ls'
alias c='clear'
# History
alias h='history | rg'
# Git
alias gc='cd "/data/data/com.termux/files/home/storage/shared/Documents/Sync-Docs"; git add .; git commit -m'
alias gl='cd "/data/data/com.termux/files/home/storage/shared/Documents/Sync-Docs"; git pull'
alias gp='cd "/data/data/com.termux/files/home/storage/shared/Documents/Sync-Docs"; git push'
alias gpl='cd "/data/data/com.termux/files/home/storage/shared/Documents/Sync-Docs"; git log --pretty=format:"%h %ad %s"'
alias gcp='cd "/data/data/com.termux/files/home/storage/shared/Documents/Sync-Docs"; git add .; git commit -m m; git push'
# One-offs
alias n='nvim'
alias fzf='fzf --bind "enter:execute(nvim {})"'
alias avenv='source venv/bin/activate'
alias py='python'
