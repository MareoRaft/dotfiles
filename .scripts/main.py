# This file contains the main installation functions, with no/minimal user interaction.
import os
from os import path
import sys
import shutil
import argparse

import utils

# establish some paths
PATH_REPO = path.dirname(path.dirname(path.abspath(__file__)))
PATH = {
	'home': path.expanduser('~'),
	'repo': PATH_REPO,
}

def install_repo():
	# move .git into home folder
	git_path_from = path.join(PATH['repo'], '.git')
	git_path_to = path.join(PATH['home'], '.git')
	shutil.move(git_path_from, git_path_to)
	# delete the repo
	shutil.rmtree(PATH['repo'])

def install_hosts():
	# update /etc/hosts with your custom hosts
	path_hosts = path.join(PATH['repo'], 'hosts')
	ip_address = '1'
	host_name = 'hh'
	utils.run(['sh', 'add-host.sh', ip_address, host_name])

if __name__ == '__main__':
	print('do not run this file directly.  run install.py instead.')
