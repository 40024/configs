
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Puts homebrew binaries at the front of the system PATH.
export PATH=$(brew --prefix)/bin:$PATH

# Set name of the theme to load --- if set to "random", it will
ZSH_THEME="powerlevel10k/powerlevel10k"

# # Load zsh-autocomplete
# source ~/.oh-my-zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# skip_global_compinit=1

# Load autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Uncomment the following line to use hyphen-insensitive completion (_ and - interchangeable).
HYPHEN_INSENSITIVE="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git)

# Disable specific completions in zsh-completions
zstyle ':completion:*' git false
zstyle ':completion:*' docker false

source $ZSH/oh-my-zsh.sh

random_color() {
  local colors=("green" "cyan" "yellow" "blue" "magenta")
  echo ${colors[$RANDOM % ${#colors[@]}]}
}




# User configuration

# Source zshrc core
source ~/.zshrc_core

# Mac one-off aliases
alias ips="ifconfig | grep 'inet ' | grep -Fv 127.0.0.1 | awk '{print $2}' "
alias code="/Applications/VSCode.app/Contents/Resources/app/bin/code"
alias scli="python /Users/user/Dev/servo-cli/main.py"

# Pingm custom script
function pingm() {
  if [ "$#" -eq 0 ]; then
    echo "Usage: pinghosts host1 [host2 ...]"
    return 1
  fi

  for host in "$@"; do
    ping -c 3 "$host"
  done
}

# Enable menu completion for tab key
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

#### Added by green-restore install-tools
autoload -Uz compinit && compinit
####

# Load zsh-syntax-highlighting; should be last.
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# [ -z "$TMUX" ] && exec tmux new-session

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
