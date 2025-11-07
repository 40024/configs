
zsh   w config and .zshrc_-ore
Prereq: Nerd fonts (sudo pacman -S nerd-fonts || brew install --cask font-meslo-lg-nerd-font)
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

nvim with and without config
git clone https://github.com/LazyVim/starter ~/.config/nvim-lazy
alias nl='NVIM_APPNAME=nvim-lazy nvim'

kitty (linux)/ghostty (mac) with configs
vimium on whatever browser you use
