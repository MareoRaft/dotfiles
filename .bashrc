# run ~/.rc, the common rc for different shells
RC_PATH="${HOME}/.rc"
if [ -f "${RC_PATH}" ]; then
    . "${RC_PATH}"
fi

# common bashrc things shared across computers

# load nvm bash completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


# if computer has it's own local bashrc, run that now
BASH_RC_LOCAL_PATH="${HOME}/.bashrc_local"
if [ -f "${BASH_RC_LOCAL_PATH}" ]; then
    . "${BASH_RC_LOCAL_PATH}"
fi


