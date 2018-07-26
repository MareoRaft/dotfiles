
### This interferes w/ tmux restore working direction, so i'm no longer user.  Besides.  with tmux, i no longer need this.
## open new terminal window in same dir: see http://superuser.com/questions/232835/open-a-new-tab-in-the-same-directory
## 1. emulate bash PROMPT_COMMAND (only for zsh)
#precmd() { eval "$PROMPT_COMMAND" }
## 2. do the opening
#PROMPT_COMMAND='pwd > "${HOME}/.cwd"'
#[[ -f "${HOME}/.cwd" ]] && cd "$(< ${HOME}/.cwd)"


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

# sourcing .profile doesn't work from tmux
alias zprofile source ~/.zprofile


# Setting PATH for Python 2.7
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
