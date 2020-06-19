# mareoraft's dotfiles

[*nix](https://en.wikipedia.org/wiki/Unix-like) config files and dotfiles that I store in my home directory

NOTE: There are other dotfiles frameworks such as https://github.com/wking/dotfiles-framework.  It would be good to learn from them and possibly use one.

The end goal of this project is to make it so that whenever I am on a new box, I can clone this repository and be ready to go with personal settings.



## DOTFILES-git branch

This branch makes my home folder itself the git repository.  So `.git` is located in my home folder.  I am using a gitignore WHITELIST, so only files explicitly checked into the repo are synced.

### To install:

  1. Clone repo
  2. You can SKIP the next two if you want and just do `mv dotfiles/.git .` instead, IF you know what you are doing.
  2. Install python dependencies with `pip install -r requirements.txt` since the version of the deps is important.
  3. Run `./install.py` (wherever that file may be inside the repo)
  4. Go to your home folder and use git as wanted.  (You may decide to `git checkout .gitignore` and then `git checkout -- .` to set all dotfiles to the repo's current state.  THIS WILL OVERWRITE YOUR DOTFILES.)

To uninstall: Remove the `.git` folder from your home folder.

Pros and cons of git approach:

Pros:

  * You have the full power of git to sync your dotfiles as needed.

Cons:

  * It is harder to see which of your config/nonconfig files are part of the repo and which ones are not.
  * You must explicitly `git add -f <filename>` new files into the project.
  * You have the classic "git repo within git repo" problem.  If you are anywhere within your folder that's not within another git repo, and you run a git command, that command will apply to THIS repo.  Do NOT type a git command without knowing what you are doing, as you could potentially wipe out your entire home folder.  For example, never use GIT-CLEAN.
