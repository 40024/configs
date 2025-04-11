# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
ZSH_THEME="agnoster"

# Load zsh-autocomplete
source ~/.oh-my-zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
skip_global_compinit=1

# Load autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Uncomment the following line to use hyphen-insensitive completion (_ and - interchangeable).
HYPHEN_INSENSITIVE="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git zsh-autocomplete)

# Disable specific completions in zsh-completions
zstyle ':completion:*' git false
zstyle ':completion:*' docker false

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code'
fi

random_color() {
  local colors=("green" "cyan" "yellow" "blue" "magenta")
  echo ${colors[$RANDOM % ${#colors[@]}]}
}


# User configuration

# User defined aliases
alias scli="python /Users/user/Dev/servo-cli/main.py"
alias code="/Applications/VSCode.app/Contents/Resources/app/bin/code"
alias c="clear"
alias gpl="git log --pretty=format:'%h %ad %s'"

# Pingm custom script
pingm() {
  if [ "$#" -eq 0 ]; then
    echo "Usage: pinghosts host1 [host2 ...]"
    return 1
  fi

  for host in "$@"; do
    ping -c 1 "$host"
  done
}

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Enable menu completion for tab key
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# Load zsh-syntax-highlighting; should be last.
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
