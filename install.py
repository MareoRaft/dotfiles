#!/usr/local/bin/python3

import os
from os import path
import sys
REPO_PATH = path.dirname(path.abspath(__file__))
sys.path.insert(0, REPO_PATH)
from config import PATH

def install():
	names = os.listdir(PATH['config'])
	for name in names:
		path_new = path.join(PATH['home'], name)
		path_exists = path.join(PATH['config'], name)
		os.symlink(path_exists, path_new)

if __name__ == '__main__':
	install()

