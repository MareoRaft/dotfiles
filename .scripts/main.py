""" This file contains the main installation functions, with no/minimal user interaction. """

# builtin imports
import os
from os import path
import sys
import shutil
import argparse
import importlib

# third-party imports

# local imports
import utils

# establish some paths
PATH_REPO = path.dirname(path.dirname(path.abspath(__file__)))
PATH = {
	'home': path.expanduser('~'),
	'repo': PATH_REPO,
	'add-host': path.join(PATH_REPO, '.scripts', 'add-host.sh'),
}

def install_repo():
	# move .git into home folder
	git_path_from = path.join(PATH['repo'], '.git')
	git_path_to = path.join(PATH['home'], '.git')
	shutil.move(git_path_from, git_path_to)
	# delete the repo
	shutil.rmtree(PATH['repo'])

def install_hosts():
	# this is a last-minute import because it might not be installed, and we only need it if we are using this function
	from python_hosts import Hosts
	# update /etc/hosts with your custom hosts
	path_hosts = path.join(PATH['repo'], 'hosts')
	# read hosts
	hosts = Hosts(path_hosts)
	# write hosts
	# note that the python_hosts library is extensive and could be used to write in a smarter way, but use add-host.sh for now
	for host_entry in hosts.entries:
		if not host_entry.is_real_entry():
			pass
		elif len(host_entry.names) > 1:
			print('Multiple host names not implemented.  (for {}.)  skipping.'.format(host_entry.names))
		else:
			ip_address = host_entry.address
			host_name = host_entry.names[0]
			utils.run(['sh', PATH['add-host'], ip_address, host_name])

if __name__ == '__main__':
	print('do not run this file directly.  run install.py instead.')
