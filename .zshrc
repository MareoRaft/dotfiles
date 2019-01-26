# run ~/.rc, the common rc for different shells
RC_PATH="${HOME}/.rc"
if [ -f "${RC_PATH}" ]; then
    emulate sh
    . "${RC_PATH}"
    emulate zsh
fi

# common zshrc things shared across computers

#... nothing here yet!


# if computer has it's own local zshrc, run that now
ZSH_RC_LOCAL_PATH="${HOME}/.zshrc_local"
if [ -f "${ZSH_RC_LOCAL_PATH}" ]; then
    . "${ZSH_RC_LOCAL_PATH}"
fi


