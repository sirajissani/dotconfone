sdassdkfsdjfklsjfskldotconfone
==========

One dotconf to rule them all!

dotConfOne is a configuration settings manager with the aim to bring all the small pieces of configuration code used for various Linux utilities under one roof. This scheme is believed to keep them all portable between computers and safe (read: fool-proof) over distribution upgrades.

Expected Usage
--------------

 - On a newly setup computer, dotconfone stores the master copy of all the configuration files
 - The dotconfone commissioning script is kept updated with the appropriate location for the file and the essentials to check for the program installation
 - An utility such as make is used to install the program using apt (or other applicable) if not installed already
