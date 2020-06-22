# run ~/.profile, which for us is common across shells
emulate sh
source ~/.profile
emulate zsh

# set up History
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt inc_append_history

#colorize the Terminal
export GREP_OPTIONS='--color=auto'
export CLICOLOR=1;

autoload -U colors && colors
PS1="%t %{$fg[magenta]%}%~ %{$reset_color%}%% "

# use the vim keymap
bindkey -v
# under the vim keymap, we now enable extra keybindings...
# enable reverse search
bindkey "^R" history-incremental-search-backward
# enable jump to beginning of line
bindkey "^A" vi-beginning-of-line
# enable jump to end of line
bindkey "^E" vi-end-of-line

# enable 'go' program
source ~/bin/go.zsh
# enable 'switch' program
source ~/bin/switch.zsh

# if computer has it's own specific zprofile, run that now
if [ -f "${HOME}/.zprofile_local" ]; then
	. "${HOME}/.zprofile_local"
fi

