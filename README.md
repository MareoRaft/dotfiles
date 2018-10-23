# mareoraft's dotfiles

n*x config files and dotfiles that I store in my home directory

NOTE: There are other dotfiles frameworks such as https://github.com/wking/dotfiles-framework.  It would be good to learn from them and possibly use one.

The end goal of this project is to make it so that whenever I am on a new box, I can clone this repository and be ready to go with personal settings.



## symlink branch

This branch keeps my dotfiles within a `config` folder within the repo.  The repo can be located anywhere.  For each dotfile, it creates a *symlink* in your home directory that points to the file of the same name in the `config` folder.

To install symlinks: `./dotfiles.py install`

To remove dotfiles: `./dotfiles.py remove`

Pros and cons of symlink approach:

Pros:

  * Everything in the repo is together in the repo folder.
  * It is easy to see which of your config files are part of the repo and which ones are not.

Cons:

  * If you move folders around, symlinks can break.
  * No "granular" syncing: If you have not a dotfile but a dot*folder*, then that folder needs to be entirely checked into the repo or not.  You can't have *some* of the files within the folder synced to the repo and others not.


### config directory

All configuration files (aka "dotfiles") are located here.  This is the *content* that you wish to sync across computers.
