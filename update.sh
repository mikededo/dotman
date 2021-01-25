#!/bin/zsh

# Git repository location inside the computer
REPO="$HOME/Documents/dotman"

# Locations
GIT="$HOME/.gitconfig"
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
	cp $GIT			-vu	$REPO/.gitconfig
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
		printf "\n%s\n" "Commiting all files..."

		printf "%s" "Custom commit message [Y/n]? "
		read yn

		msg="Updating .dotfiles"
		if [ "$yn" = "Y" ] || [ "$yn" = "y" ]; then
			printf "%s" "> "
			read msg	
		fi

		printf "\n%s\n" "Adding files to commit..."
		git add --all
		printf "\n%s\n" "Committing files..."
		git commit -m "$msg"
		printf "\n%s\n" "Pushin files..."
		git push origin main
	fi

	exit
}

folder_init
update
check_git
