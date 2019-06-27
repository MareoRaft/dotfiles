import sys
from os import path
import subprocess

def run(cmd_list, verbose=True):
	assert isinstance(cmd_list, list)
	# use 'check_output' if using python2
	if sys.version_info[0] <= 2:
		output = subprocess.check_output(cmd_list)
	# use 'run' if using python3
	else:
		output = subprocess.run(cmd_list)
	if verbose:
		print(output)
