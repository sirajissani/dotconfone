dotconfone
==========

One dotconf to rule them all!

dotConfOne is a configuration settings manager with the aim to bring all the small pieces of configuration code used for various Linux utilities under one roof. This scheme is believed to keep them all portable between computers and safe (read: fool-proof) over distribution upgrades.

Expected Usage
--------------

 - On a newly setup computer, dotconfone stores the master copy of all the configuration files
 - The dotconfone commissioning script is kept updated with the appropriate location for the file and the essentials to check for the program installation
 - An utility such as make is used to install the program using apt (or other applicable) if not installed already

Current Usage
-------------

Obviously there is a long way to go. Presently, the following information can be helpful

 - `packages` directory contains several directories with commonly 
 used program names containing specific scripts

 - `packages/*.sh` are helper scripts you can start with:
              - `capture.sh`: Capture your present settings
              - `deploy.sh`: Deploy the settings in the repo

 - _Capture_: It is assumed that users make changes to local conf files,
 for example, `~/.vimrc` and _capturing_ copies the latest file for
 subsequent comparison and introspection using git tools.

 - _Deploy_: The deployment workflow generates a package list `pref.conf`
 which is only an array of packages contained in the script groups supplied
 with the repo. Presently it only looks in the `packages/ubuntu/ directory.
