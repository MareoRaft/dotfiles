from os import path
import sys
REPO_PATH = path.dirname(path.abspath(__file__))
sys.path.insert(0, REPO_PATH)

PATH = {
	'home': path.expanduser('~'),
	'repo': REPO_PATH,
	'config': path.join(REPO_PATH, 'config'),
}
