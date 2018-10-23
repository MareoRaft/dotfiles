#!/usr/local/bin/python3

import os
from os import path
import sys
import shutil

# establish some paths
REPO_PATH = path.dirname(path.abspath(__file__))
PATH = {
	'home': path.expanduser('~'),
	'repo': REPO_PATH,
}

def install():
	# move .git into home folder
	git_path_from = path.join(PATH['repo'], '.git')
	git_path_to = path.join(PATH['home'], '.git')
	shutil.move(git_path_from, git_path_to)
	# delete the repo
	shutil.rmtree(PATH['repo'])

def install_safe():
	if PATH['repo'] == PATH['home']:
		print('The location of the directory containing `install.py` IS your home folder.  This suggests that dotfiles is ALREADY INSTALLED.  Aborting.')
	else:
		response = input('The detected location of the dotfiles repo is {}.  Is this correct?  If you type "y" and hit RETURN, that folder will be DELETED, so please make sure it is correct.'.format(PATH['repo']))
		if response == 'y':
			install()
			print('Installation complete.  Go to your home directory.')
		else:
			print('You did not enter "y".  Aborting.')

if __name__ == '__main__':
	install_safe()
