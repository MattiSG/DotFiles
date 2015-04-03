My portable workspace config.

Architecture and aliases might be of interest to other users.


New machine or user
-------------------

Run `init.sh`.


Architecture
------------

### `machine` folder

Contains scripts to be executed when setting up a new machine.


### `session` folder

Contains scripts to be executed when setting up a new user.


### `dots` folder

Files to be symlinked in `~/.<name>`.


### `functions` folder

Shell shortcuts that won't fit in aliases.


### `hooks` folder

Collection of generic Git hooks.


### `Library` folder

OSX-specific configuration files to be symlinked. Allows for portable, tracked preferences rather than using `defaults` to override an existing configuration.


### `source` folder

These files are to be sourced on login to be operational.
