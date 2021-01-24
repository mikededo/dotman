#!/bin/zsh

REPO="$HOME/Documents/dotman"

# Locations
NVIM="$HOME/.config/nvim/init.vim"
ZSH="$HOME/.zshrc"
P10K="$HOME/.p10k.zsh"
OHMY="$HOME/.oh-my-zsh/oh-my-zsh.sh"
CUSTOM="$HOME/.oh-my-zsh/custom"

# Check if folders exist
folder_init() {
	if [[ ! -d $REPO/nvim ]]; then
		printf "%s\n" "Creating nvim folder..."
		mkdir -p $REPO/nvim
	fi

	if [[ ! -d $REPO/.oh-my-zsh ]]; then
		printf "%s\n" "Creating oh-my-zsh folder..."
		mkdir -p $REPO/.oh-my-zsh/custom
	fi
}

update() {
	printf "%s\n" "Checking for file changes and updating..."
	# Start copying
	cp $NVIM		-vu	$REPO/nvim/init.vim
	cp $ZSH 		-vu	$REPO/.zshrc
	cp $P10K 		-vu 	$REPO/.p10k.zsh
	cp $OHMY 		-vu	$REPO/.oh-my-zsh/oh-my-zsh.sh
	cp $CUSTOM/aliases.zsh 	-vu	$REPO/.oh-my-zsh/custom
}

check_git() {
	printf "%s\n" "Git checks..."
	if out=$(git status --porcelain) && [ -z "$out"  ]; then
		printf "%s\n" "Directory clean"	
	else
		# There are changes
		git status -s
		printf "%s\n" "Commiting all files..."
		git add --all

		printf "%s" "Custom commit message [Y/n]? "
		read -n 1 yn
		if [ $yn = 'Y' ] || [ $yn = 'y' ]; then
			printf "%s" "> "
			read msg
			git commit -m $msg
		else
			git commit -m "Updating .dotfiles"
		fi
		
		git push origin main
	fi

	exit
}

folder_init
update
check_git
