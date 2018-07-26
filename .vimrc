"au BufRead,BufNewFile * start "this makes INSERT mode enabled when vim opens

set number "this shows line numbers on left

set ignorecase "this ignores case when searching
set smartcase "this UNIGNORES case when at least one letter in search phrase it capitalized
"together, case is only ignored when all of search phrase is lowercase

set scrolloff=2 "this guarantees 2 lines buffer from the edge of the window (unless you are at the very beg. or end of file)

syntax on "make sure syntax highlighting is on

filetype on "enables filetype detection
au BufNewFile,BufRead *.json set filetype=javascript
au BufNewFile,BufRead *.pre-json set filetype=javascript "pre-json extension files will follow javascript syntax highlighting
