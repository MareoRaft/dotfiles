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
PATH = dict()
PATH['repo'] = path.dirname(path.dirname(path.abspath(__file__)))
PATH['home'] = path.expanduser('~')
PATH['add-host'] = path.join(PATH['repo'], '.scripts', 'add-host.sh')
PATH['hosts'] = path.join(PATH['home'], 'hosts')
PATH['ssh-config'] = path.join(PATH['home'], '.ssh', 'config')

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

def configure_and_install_host(name, ip_address):
	''' Add host to `hosts` file and to `.ssh/config` file, then run `install_hosts`. '''
	# error check
	usage_example = 'usage example: python3 install.py host {hostname} {ipaddress}'
	if not name:
		raise ValueError(f'hostname missing... {usage_example}')
	if not ip_address:
		raise ValueError(f'ip address missing... {usage_example}')
	# add to hosts file
	host_string = f'\n# Added by my dotfiles convenience script. Feel free to reorganize.\n{ip_address}\t{name}\n'
	with open(PATH['hosts'], 'a') as f:
		f.write(host_string)
	# add to ~/.ssh/config
	host_string = f'\nHOST {name}\n\tHostName {name}\n\tUser root\n\tIdentityFile ~/.ssh/id_ed25519\n'
	with open(PATH['ssh-config'], 'a') as f:
		f.write(host_string)
	# run `install_hosts` in order to add to /etc/hosts too
	install_hosts()

if __name__ == '__main__':
	print('do not run this file directly.  run install.py instead.')
