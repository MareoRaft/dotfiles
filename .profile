#!/bin/sh

# convenient IP addresses for servers
BLACKBERRY=67.205.183.87 # login as freebsd
FUJI=159.89.229.227 # login as freebsd
DREAMHOST=matthewlancellotti.com # login as dh_fk2i75

# optional freebsd tips
if [ -x /usr/bin/fortune ]; then
	/usr/bin/fortune freebsd-tips
fi

# make sure ssh agent is running
eval "$(ssh-agent -s)"



# ENVIRONMENT VARIABLES

# default editor
export EDITOR="vim"

# set the LANG to follow UTF-8, and other locale settings
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

# remember your docker id for use with docker
export DOCKERID="mvlancellotti"

# things for BNY
## for IRIS dev environment
export REACT_APP_ENV=TEST


# PATHS

# let's add some places to PATH:
# it makes sense for locals to come first, except that MacTeX requested to come before /opt.
PATH=/usr/texbin
PATH=$PATH:/usr/local/bin
PATH=$PATH:/opt/local/bin
PATH=$PATH:/usr/bin
PATH=$PATH:/bin
PATH=$PATH:/usr/local/sbin
PATH=$PATH:/opt/local/sbin
PATH=$PATH:/usr/sbin
PATH=$PATH:/sbin
PATH=$PATH:/opt/X11/bin
PATH=$PATH:~/node_modules
PATH=$PATH:~/npm-global/bin
PATH=$PATH:~/.npm-global/bin
PATH=$PATH:~/.local/bin
PATH=$PATH:~/bin
export PATH

# Perl path
# (i chose to NOT append the first one to flush PERL5LIB)
PERL5LIB=.
PERL5LIB=$PERL5LIB:/Users/Matthew/Dropbox/mm/Library/Perl/5.16/Custom
PERL5LIB=$PERL5LIB:/Users/Matthew/Dropbox/mm/Library/Perl/5.16/Downloads
PERL5LIB=$PERL5LIB:/usr/local/Library/Perl/5.16/Matt
PERL5LIB=$PERL5LIB:/usr/local/Library/Perl/5.16/Downloads
PERL5LIB=$PERL5LIB:/usr/local/Library/Perl/5.16/Mo
export PERL5LIB

# Python path
# put it in .profile_local

# Mizar path
export MIZFILES=/usr/local/share/mizar

# Java path
# put it in .profile_local

# Gem (for Ruby) path
# put it in .profile_local

# Node Version Manager path
export NVM_DIR="$HOME/.nvm"

# load nvm itself
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# ALIASES
alias beadshorper='cd ~ && cd "Google Drive/KnewWaves/code/old/beadshorper.Mar22.2016" && python3 main.py "~/Google Drive/KnewWaves/content"'
alias dunnet='emacs -batch -l dunnet'
alias my.test='py.test -x -s -vv'
alias kw.test='cd ~/programming/knewwaves/python/test && ./pytest-ordered.sh'
alias poda='perl /Users/Matthew/Dropbox/mm/poda.pl'
alias pwd='\pwd | sed -E s#/+#/#g'
alias r='radian'
alias isage='sage -ipython'
alias stroke='/System/Library/CoreServices/Applications/Network\ Utility.app/Contents/Resources/stroke'
alias sublimetext='subl'
alias sublimemerge='smerge'
alias ssh-X='ssh -X -C -c blowfish' # convenient ssh for x11
alias belenv='source /Users/Matthew/programming/belacam/belacamenv/bin/activate'
alias elf='electron-forge'
alias gnch='ganache-cli'
alias ganache-app='open -a "Ganache"'
alias jenkins='java -jar ~/HUBCITYMEDIA-repo/jenkins-cli.jar -s http://10.0.51.117:3000/'
alias engine='/Users/adc2btx/bin/cli-darwin-amd64-18.8.3.bin'
alias sms='/Users/adc2btx/bin/discovery-sms-cli-macos-amd64-1.0.2.bin'


# Finally, if the server has it's own server-specific profile, run that now.  This should be the LAST thing in the script.
if [ -f "${HOME}/.profile_local" ]; then
	. "${HOME}/.profile_local"
fi
