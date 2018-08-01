#  \[\033[           x;             y                     m                      \]
#     ESC       SGR parameters                      end an SGR code

#see color.pl and MohithMatthew/256colors2.pl
#semicolons::   0 - regular, 1 - bold, 2 - faint/dark, 3 - (italic),  4 - underline, 5 - blink, 6- (blinkrapid), 7 - reverse video on, 8 - invisible


#          background    ?????     [  textred          textyellow      textmagenta       textblue         textregular     textblack]   ????    >
#   PS1="\[\033[41m\]\[\033[30m\][\[\033[31m\]\u@\[\033[1;33m\]\h:\[\033[1;35m\]\W,\[\033[1;34m\] \@,\[\033[1;37m\]\d\[\033[30m\]]\[\033[0m\]>"
#                                             \u is the User.  \h is the computer \W is directory \@ is the time   \d is the date
PS1="\@ \[\033[35m\]\w\[\033[0m\] \$ "
# all possible stuff:
#PS1="hostnameh \h hostname \H basenametermdevice \l shell \s username \u cwd \w cwdbase \W hist \! cmdnum \# effectUIDind \$ oct \nnn END"


#colorize the Terminal
export GREP_OPTIONS='--color=auto'
export CLICOLOR=1;

# run ~/.profile too, in sh-mode for increased compatability
source ~/.profile

# try to enable 'go' program
source ~/bin/go.bash
