#!/bin/sh

# set the LANG to follow UTF-8
export LANG=en_US.UTF-8

# convenient IP addresses for servers
BLACKBERRY=67.205.183.87 # login as freebsd
FUJI=159.89.229.227 # login as freebsd
DREAMHOST=matthewlancellotti.com # login as dh_fk2i75

# optional freebsd tips
if [ -x /usr/bin/fortune ]; then
	/usr/bin/fortune freebsd-tips
fi

# make sure ssh agent is running (not tested)
eval "$(ssh-agent -s)"

# set some environment variables
export EDITOR="vim"
# remember your docker id for use with docker
export DOCKERID="mvlancellotti"

# let's add some places to PATH:
# it makes sense for locals to come first, except that MacTeX requested to come before /opt.
export PATH=/usr/texbin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/opt/local/bin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/opt/local/sbin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/sbin
export PATH=$PATH:/opt/X11/bin
export PATH=$PATH:~/node_modules
export PATH=$PATH:~/npm-global/bin
export PATH=$PATH:~/.npm-global/bin

# Perl Path
#way to append for many things: (i chose to NOT append the first one to flush PERL5LIB)
export PERL5LIB=/usr/local/Library/Perl/5.16/Mo
export PERL5LIB=/usr/local/Library/Perl/5.16/Downloads"${PERL5LIB:+:$PERL5LIB}"
export PERL5LIB=/usr/local/Library/Perl/5.16/Matt"${PERL5LIB:+:$PERL5LIB}"
export PERL5LIB=/Users/Matthew/Dropbox/mm/Library/Perl/5.16/Downloads"${PERL5LIB:+:$PERL5LIB}"
export PERL5LIB=/Users/Matthew/Dropbox/mm/Library/Perl/5.16/Custom"${PERL5LIB:+:$PERL5LIB}"
export PERL5LIB=."${PERL5LIB:+:$PERL5LIB}" #this puts the current directory ON TOP

# Mizar Path
export MIZFILES=/usr/local/share/mizar

# aliases, for convenience
alias beadshorper='cd ~ && cd "Google Drive/KnewWaves/code/old/beadshorper.Mar22.2016" && python3 main.py "~/Google Drive/KnewWaves/content"'
alias dunnet='emacs -batch -l dunnet'
alias my.test='py.test -x -s -vv'
alias kw.test='cd ~/programming/knewwaves/python/test && ./pytest-ordered.sh'
alias poda='perl /Users/Matthew/Dropbox/mm/poda.pl'
alias pwd='\pwd | sed -E s#/+#/#g'
alias r='rice'
alias isage='sage -ipython'
alias stroke='/System/Library/CoreServices/Applications/Network\ Utility.app/Contents/Resources/stroke'
alias sublime='open -a "Sublime Text"'
alias ssh-X='ssh -X -C -c blowfish' # convenient ssh for x11
alias belenv='source /Users/Matthew/programming/belacam/belacamenv/bin/activate'
alias elf='electron-forge'

# Finally, if the server has it's own server-specific profile, run that now.  This should be the LAST thing in the script.
if [ -f "${HOME}/.profile_local" ]; then
	. "${HOME}/.profile_local"
fi

