#colorize the Terminal
export GREP_OPTIONS='--color=auto'
export CLICOLOR=1;

autoload -U colors && colors
PS1="%{$fg[magenta]%}%~ %{$reset_color%}%% "


# run ~/.profile too, in sh-mode for increased compatability
emulate sh
source ~/.profile
emulate zsh

source ~/bin/go.zsh


# Setting PATH for Python 2.7
# The original version is saved in .zprofile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

