# mareoraft's dotfiles

n*x config files and dotfiles that I store in my home directory

NOTE: There are other dotfiles frameworks such as https://github.com/wking/dotfiles-framework.  It would be good to learn from them and possibly use one.

The end goal of this project is to make it so that whenever I am on a new box, I can clone this repository and be ready to go with personal settings.



## DOTFILES-git branch

This branch makes my home folder itself the git repository.  So `.git` is located in my home folder.  I am using a gitignore WHITELIST, so only files explicitly checked into the repo are synced.

To install: Clone repo, then run `./install.py` inside of it.  Then go to your home folder and use `git reset` or `git checkout -- <filename>` as necessary until your home folder dotfiles are synced with the repo.

To uninstall: Remove the `.git` folder from your home folder.

Pros and cons of git approach:

Pros:

  * You have the full power of git to sync your dotfiles as needed.

Cons:

  * It is harder to see which of your config files are part of the repo and which ones are not.
  * You have the classic "git repo within git repo" problem.  If you are anywhere within your folder that's not within another git repo, and you run a git command, that command will apply to THIS repo.  Do NOT type a git command without knowing what you are doing, as you could potentially wipe out your entire home folder.
