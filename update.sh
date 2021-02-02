#!/bin/zsh

# Git repository location inside the computer
REPO="$HOME/Documents/dotman"

# Locations
GIT="$HOME/.gitconfig"
NVIM="$HOME/.config/nvim/init.vim"
ZSH="$HOME/.config/zsh/.zshrc"
ZSHENV="$HOME/.zshenv"
P10K="$HOME/.config/zsh/.p10k.zsh"
OHMY="$HOME/.config/zsh/.oh-my-zsh/oh-my-zsh.sh"
CUSTOM=".oh-my-zsh/custom"
ALIASFIL="$HOME/.config/zsh/$CUSTOM/alias.zsh"
ALIASDIR="$HOME/.config/zsh/$CUSTOM/aliases/"

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
	cp $GIT			  -vua  $REPO/.gitconfig
	cp $NVIM		  -vua  $REPO/nvim/init.vim
	cp $ZSH 		  -vua	$REPO/.zshrc
	cp $ZSHENV 	  -vua	$REPO/.zshenv
	cp $P10K 		  -vua	$REPO/.p10k.zsh
	cp $OHMY 		  -vua	$REPO/.oh-my-zsh/oh-my-zsh.sh
	cp $ALIASFIL	-vua	$REPO/$CUSTOM
	cp $ALIASDIR	-vura	$REPO/$CUSTOM
}

run_git() {
	printf "\n%s\n" "Git checks..."
	if out=$(git status --porcelain) && [ -z "$out"  ]; then
		printf "%s\n" "Directory clean"	
	else
		# There are changes
		git status -s

		printf "\n%s\n" "Adding files to commit..."
		git add --all

		printf "%s" "Commit changes [Y/n]? "
		read yn
		if [ "$yn" != "Y" ] && [ "$yn" != "y" ]; then
			exit 0
		fi

		printf "%s" "Custom commit message [Y/n]? "
		read yn
		msg="Updating .dotfiles"
		if [ "$yn" != "Y" ] && [ "$yn" != "y" ]; then
			printf "%s" "> "
			read msg	
		fi

		printf "\n%s\n" "Committing files..."			
		git commit -m "$msg"

		printf "%s" "Push changes [Y/n]? "
		read yn
		if [ "$yn" != "Y" ] && [ "$yn" != "y" ]; then
			exit 0
		fi

		printf "\n%s\n" "Pushing files..."
		git push origin main
	fi

	exit 0
}

folder_init
update

printf "%s" "Save changes [Y/n]? "
read yn
if [ "$yn" = "Y" ] || [ "$yn" = "y" ]; then
	run_git
fi

