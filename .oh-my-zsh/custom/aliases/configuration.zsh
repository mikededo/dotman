# Configurations
alias ohmyconfig="vim $HOME/.oh-my-zsh/oh-my-zsh.sh"
alias p10kconfig="vim $HOME/.p10k.zsh"
alias zshconfig="vim $HOME/.zshrc"
alias nvimconfig="vim $HOME/.config/nvim/init.vim"
alias vimconfig="vim $HOME/.vimrc"
alias dotman="$HOME/Documents/dotman"
alias updzsh="exec zsh"

# Alias files
alias cfgalias="vim $HOME/.oh-my-zsh/custom/aliases/configuration.zsh"
alias npmalias="vim $HOME/.oh-my-zsh/custom/aliases/npm.zsh"

# apt
si() { sudo apt install "$@" }
sun() { sudo apt remove --purge "$@" }
alias sysupdt="sudo apt update && sudo apt upgrade"
alias aptclean="sudo apt autoclean && sudo apt autoremove"

# File manipulation
alias rmd="rm -rf"                  # Lazy remove files
lazymv() { mv $1 $(dirname $1)$2 }  # Lazy move files

# Other 
alias sudo="sudo "                  # Make sudo not skip alias
alias vim="nvim"                    # Open nvim over vim
alias svim="sudo vim"               # Same but sudo
alias falias="alias | grep "        # Search for an alias
alias dotupdcfg="vim $HOME/Documents/dotman/update.sh"
