#!/bin/zsh

# 'sd' stands for 'switch directory'.  It is similar to 'cd', but it substitutes a folder in the path
sd() {
	# current working directory
	working_directory=$(pwd)

	# desired working directory
	# todo: use awk?
	working_directory=$(printf "$working_directory" | sed 's@/COMMONS@/'"$1"'@')
	working_directory=$(printf "$working_directory" | sed 's@/IDG@/'"$1"'@')
	working_directory=$(printf "$working_directory" | sed 's@/AR@/'"$1"'@')

	# change directory
	cd "$working_directory"
}
