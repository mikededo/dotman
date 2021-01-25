# Configurations
alias aliasconfig="vim $HOME/.oh-my-zsh/custom/aliases.zsh"
alias ohmyconfig="vim $HOME/.oh-my-zsh/oh-my-zsh.sh"
alias p10kconfig="vim $HOME/.p10k.zsh"
alias zshconfig="vim $HOME/.zshrc"
alias nvimconfig="vim $HOME/nvim/init.vim"
alias vimconfig="vim $HOME/.vimrc"
alias dotman="$HOME/Documents/dotman"
alias updzsh="exec zsh"

# apt
alias aptclean="sudo apt autoclean && sudo apt autoremove"
si() { sudo apt install "$@" }
sun() { sudo apt remove --purge "$@" }

# File manipulation
alias rmd="rm -rf"
lazymv() { mv $1 $(dirname $1)$2  }
# 	React
rhoc() {
	if [ -z $1 ]; then
		mkdir -p hoc && touch hoc/Wrapper.jsx
	else
		mkdir -p hoc && touch hoc/$1.jsx
	fi
}
#	json-server
alias genjs="mkdir data && touch data/db.json"
js() {
	if [ -z $1 ]; then
		json-server --watch data/db.json --port 8000
	else
		json-server --watch $1 --port 8000
	fi
}
jsp() {
	if [ -z $2 ]; then
		json-server --watch data/db.json --port $1
	else
		json-server --watch $1 --port $2
	fi
}

# npm
#	Scripts
alias ni="npm install"
alias nis="npm install --save"
alias nxi="npx install"
alias ns="npm start"
alias nrs="npm run start"
#	Packages
alias nrrd="nis react-router-dom"
alias nrpt="nis prop-types"

# Other 
alias vim="nvim"
alias svim="sudo vim"
alias findalias="alias | grep "
