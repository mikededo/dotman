# Configurations
alias aliasconfig="vim $HOME/.oh-my-zsh/custom/aliases.zsh"
alias ohmyconfig="vim $HOME/.oh-my-zsh/oh-my-zsh.sh"
alias p10kconfig="vim $HOME/.p10k.zsh"
alias zshconfig="vim $HOME/.zshrc"
alias nvimconfig="vim $HOME/nvim/init.vim"
alias vimconfig="vim $HOME/.vimrc"
alias dotman="$HOME/Documents/dotman"

# apt
alias aptclean="sudo apt autoclean && sudo apt autoremove"
si() { sudo apt install "$@" }
sun() { sudo apt remove --purge "$@" }

# File manipulation
alias rmd="rm -rf"
lazymv() { mv $1 $(dirname $1)$2  }
# 	React
rhoc() {
	if [[ -z $1 ]]; then
		mkdir -p hoc && touch hoc/Wrapper.jsx
	else
		mkdir -p hoc && touch hoc/$1.jsx
	fi
}

# npm
alias ni="npm install"
alias nis="npm install --save"
alias nxi="npx install"
alias ns="npm start"
alias nrs="npm run start"

# Other 
alias vim="nvim"
