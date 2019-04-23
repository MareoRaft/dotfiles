# note to ME
# PLEASE read https://askubuntu.com/questions/463462/sequence-of-scripts-sourced-upon-login CAREFULLY
# using bashrc may not make sense.  it's possible that NVM was mistaken to put it here

# run ~/.rc, the common rc for different shells
RC_PATH="${HOME}/.rc"
if [ -f "${RC_PATH}" ]; then
    . "${RC_PATH}"
fi

# if computer has a user-wide /etc/bashrc, run that now
BASH_RC_ETC_PATH="/etc/bashrc"
if [ -f "${BASH_RC_ETC_PATH}" ]; then
    . "${BASH_RC_ETC_PATH}"
fi

# common bashrc things shared across computers

# load nvm bash completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


# if computer has it's own local bashrc, run that now
BASH_RC_LOCAL_PATH="${HOME}/.bashrc_local"
if [ -f "${BASH_RC_LOCAL_PATH}" ]; then
    . "${BASH_RC_LOCAL_PATH}"
fi

