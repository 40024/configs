# Disable auto update prompt
DISABLE_UPDATE_PROMPT=true

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Add user configurations here
# For HyDE to not touch your beloved configurations,
# we added 2 files to the project structure:
# 1. ~/.hyde.zshrc - for customizing the shell related hyde configurations
# 2. ~/.zshenv - for updating the zsh environment variables handled by HyDE // this will be modified across updates

DISABLE_UPDATE_PROMPT=true

#  Plugins 
# oh-my-zsh plugins are loaded  in ~/.hyde.zshrc file, see the file for more information

#  Aliases 
# Core
alias s='sudo'
alias p='sudo /usr/local/bin/pacman-names'
alias z='cd'
# History
alias h='history | rg'
alias hist='history'
# Clipboard
alias pbcopy='wl-copy'
alias xsel='wl-copy'
# Git
alias gc="git add .; git commit -m"
alias gl="git pull"
alias gp="git push"
alias gpl="git log --pretty=format:'%h %ad %s'"
alias gcp="git add .; git commit -m m; git push"
# One-offs
alias n='nvim'
alias sn='sudo nvim'
alias fzf="fzf --bind 'enter:execute(nvim {})'"
alias ts='sudo timeshift'
alias nk='kitty $(pwd) &'
alias open='dolphin'
alias avenv="source venv/bin/activate"
alias mcalc='python "/home/v/Documents/sync-docs/Reference Lists/Food/_Macros/Calculator/macro_calculator.py"'

#  This is your file 
bindkey '^H' backward-kill-word
bindkey '^E' kill-line
bindkey '^A' backward-kill-line

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
