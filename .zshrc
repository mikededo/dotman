# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# #
# THEME
# #
# Powerlevel10k
export ZSH="/home/mddg/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
# Powerlevel10k Instant Prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable colors
autoload -U colors && colors

# #
# PLUGINS
# #
plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
)

# #
# HISTORY
# #
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# #
# COMPLETION
# #
autoload -U compinit && compinit -u
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
setopt correct						# Command spelling
setopt complete_in_word		# Completion from within a word/phrase
setopt completealiases		# Aliases completion
setopt list_ambiguous			# Complete until it gets ambiguous

# #
# OTHER
# #
# Preferred editor for local and remote sessions
export EDITOR='nvim'
# Custom folder
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

# Needed to control save on vim
alias vim="stty stop '' -ixoff; nvim"

export TERM=xterm-256color

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
