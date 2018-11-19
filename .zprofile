#colorize the Terminal
export GREP_OPTIONS='--color=auto'
export CLICOLOR=1;

autoload -U colors && colors
PS1="%{$fg[magenta]%}%~ %{$reset_color%}%% "

# use the vim keymap
bindkey -v
# under the vim keymap, we now enable extra keybindings...
# enable reverse search
bindkey "^R" history-incremental-search-backward
# enable jump to beginning of line
bindkey "^A" vi-beginning-of-line
# enable jump to end of line
bindkey "^E" vi-end-of-line

# try to enable 'go' program
source ~/bin/go.zsh

# if computer has it's own specific zprofile, run that now
if [ -f "${HOME}/.zprofile_local" ]; then
	. "${HOME}/.zprofile_local"
fi

# run ~/.profile too, in sh-mode for increased compatibility
emulate sh
source ~/.profile
emulate zsh

