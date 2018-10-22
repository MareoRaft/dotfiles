#!/usr/local/bin/python3

import os
from os import path
import sys
REPO_PATH = path.dirname(path.abspath(__file__))
sys.path.insert(0, REPO_PATH)
from config import PATH

def names():
	return os.listdir(PATH['config'])

def install():
	for name in names():
		path_new = path.join(PATH['home'], name)
		path_exists = path.join(PATH['config'], name)
		os.symlink(path_exists, path_new)

def remove():
	for name in names():
		path_link = path.join(PATH['home'], name)
		os.remove(path_link)

subcommands = {
	'install': install,
	'remove': remove,
}

if __name__ == '__main__':
	args = sys.argv
	if len(args) > 2:
		raise ValueError('too many arguments')
	# default to install command
	if len(args) == 1:
		args.append('install')
	# execute command
	# let's replace this with 'commander' library, like in bandits
	subcommand = subcommands[args[1]]
	subcommand()
