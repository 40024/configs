
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

#  Plugins 
# oh-my-zsh plugins are loaded  in ~/.hyde.zshrc file, see the file for more information

#  Linux specific config 
alias pbcopy='wl-copy'

# Aliases for Linux
# Clipboard
alias pbcopy='wl-copy'
alias xsel='wl-copy'
# Shortcuts for existing
alias open='dolphin'
alias q='qalc'
alias ts='sudo timeshift'
# My ~/bin scripts
alias cal='/home/v/bin/cal_wrapper.sh'
alias dh='python /home/v/bin/dh.py'
alias dhp='python /home/v/bin/dhp.py'
alias dynamic_wallpaper='python /home/v/bin/dynamic_wallpaper.py'
alias ical='python /home/v/bin/ical.py'
alias mcalc='python "/home/v/Documents/sync-docs/Obsidian Vault/Food/_Macros/Calculator/macro_calculator.py"'
alias p='/home/v/bin/pacman_names_wrapper.sh'
alias sink_combine='python /home/v/bin/sink_combine.py'
alias wh='python /home/v/bin/wh.py'



# Source main config
source ~/.zshrc_core.sh

# Android studio stuff
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
