# Version 1.1

# state the desired paths that go will search in. The default depth to search in each path is 4, but this may be changed in find_go()
# input each path on a separate line
GOPATH="$HOME
$HOME/Dropbox
/
."

# given path and dir, run find. if nonempty, take the first entry, cd, pwd, exit
find_go() {
    DEPTH=4
    SPATH="$1"
    echo $SPATH
    DIR="$2"; echo 'hi'; shift
    echo 'DIR is: $DIR'
    until [ -z "$2" ] # concatenate args with a space
    do
        DIR="$DIR $2"; shift
    done
    echo 'DIR is: '
    echo $DIR
    FINDS=$(find "$SPATH" -maxdepth $DEPTH -name "$DIR" 2>/dev/null)
    IFS=$'\n' # interpolation necessary b/c '' will make \ and n field separators.
    for FIND in $FINDS # although this is a loop, the goal is to take the first entry if there is one
    do
        # cd to first entry, pwd, exit
        cd "$FIND"
        pwd
        IFS=$' \t\n'
        return 0 # success! we found the match!
    done
    IFS=$' \t\n'
    return 1 # failure. we didn't find it in this path.
}

go() {
	INPATH="$1"
    for SPATH in $GOPATH # foreach path, go to the inputted directory if possible
    do
        find_go "$SPATH" $@ && return # if we successfully went to the directory, exit the program
    done
	# if we haven't returned yet, nothing was found.  let's cd incase this should have been a cd command (absolute path input)
	cd "$INPATH" 2>/dev/null || echo 'You cannot go there.'
	pwd
}
