#!/usr/local/bin/python3
# This is the user-facing script for installation.  Deals with user interaction and then hands off control to main.py.
# Example usage:
# python3 install.py repo --> installs the repo in your home directory
# python3 install.py hosts --> updates your /etc/hosts file with whatever new hosts it finds in ~/hosts
# python3 install.py host {hostname} {ipaddress} --> adds new host to ~/hosts, /etc/hosts, and ~/.ssh/config

import os
from os import path
import sys
import shutil
import argparse

import main

# establish some paths
PATH_REPO = path.dirname(path.dirname(path.abspath(__file__)))
PATH = {
	'home': path.expanduser('~'),
	'repo': PATH_REPO,
}

def install_repo_safe():
	if PATH['repo'] == PATH['home']:
		print('The location of the directory containing `install.py` IS your home folder.  This suggests that dotfiles is ALREADY INSTALLED.  Aborting.')
	else:
		response = input('The detected location of the dotfiles repo is {}.  Is this correct?  If you type "y" and hit RETURN, that folder will be DELETED, so please make sure it is correct.'.format(PATH['repo']))
		if response == 'y':
			main.install_repo()
			print('Installation complete.  Go to your home directory and use git to sync.')
		else:
			print('You did not enter "y".  Aborting.')

def install_safe(args):
	to_install = args.install_type[0]
	print(to_install)
	if to_install == 'repo':
		install_repo_safe()
	elif to_install == 'hosts':
		main.install_hosts()
	elif to_install == 'host':
		host_name = args.host_name[0]
		ip_address = args.ip_address[0]
		main.configure_and_install_host(host_name, ip_address)
	else:
		print('You must run `./install.py repo` to install the repo for the first time, or `./install.py hosts` to update your hosts file, or `./install.py host hostname ipaddress` to add a host.  Aborting.')

def get_args():
	# setup the arg parsing for the python script
	parser = argparse.ArgumentParser(description='install dotfiles.')
	parser.add_argument('install_type', metavar='what_to_install', type=str, nargs=1, help='what you want to install')
	parser.add_argument('host_name', metavar='[hostname]', type=str, nargs='?', default=[''], help='name of host')
	parser.add_argument('ip_address', metavar='[ip_address]', type=str, nargs='?', default=[''], help='ip address of host')
	return parser.parse_args()

if __name__ == '__main__':
	args = get_args()
	install_safe(args)
