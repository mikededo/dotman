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

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# #
# COMPLETION
# #
autoload -U compinit
compinit
setopt correct			# Command spelling
setopt complete_in_word		# Completion from within a word/phrase
setopt completealiases		# Aliases completion
setopt list_ambiguous		# Complete until it gets ambiguous

# #
# OTHER
# #
# Preferred editor for local and remote sessions
export EDITOR='nvim'
# Custom folder
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

