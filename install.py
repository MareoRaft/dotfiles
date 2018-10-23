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

if __name__ == '__main__':
	install()
