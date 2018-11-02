# Make sure bashrc runs (I think this is needed on RHEL, but not other OS's)
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# see notes for PS1 options
PS1="\@ \[\033[35m\]\w\[\033[0m\] \$ "

#colorize the Terminal
export GREP_OPTIONS='--color=auto'
export CLICOLOR=1;

# try to enable 'go' program
source ~/bin/go.bash

# if computer has it's own specific bash_profile, run that now
if [ -f "${HOME}/.bash_profile_local" ]; then
	. "${HOME}/.bash_profile_local"
fi

# run ~/.profile too
source ~/.profile
