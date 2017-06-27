#!/bin/bash

# USAGE
#
#   `./link.sh`
#
# Links the user's dot-confs with the managed versions.
# Run as root to apply settings to root user-account.
#
#
# DESCRIPTION
#
# The following dot-confs are currently managed
#
#    * `.vimrc`
#    * `.vim/`
#    * `.bashrc`
#    * `.bash_aliases`
#
# The existing files, if not already linked are copied as
# `file.bak` and then links are created to the managed
# versions contained in this package directory.
#
#
# SEE ALSO
#
#   `unlink.sh`
#


function backup_and_link() {
	if [ ! -e $1 ] || [ ! -h $1 ]; then
		echo "  Backing up  $1 --> $1.bak"
		mv $1 $1.bak
		echo "  Linking     $1 --> $2"
		ln -s $2 $1
	else
		echo "  Skipping    $1"
	fi
}


if [ ! -e "$HOME" ]; then
	exit -1;
fi

DCO_PATH=$PWD/$(dirname $0)

backup_and_link $HOME/.vimrc          $DCO_PATH/packages/vim/.vimrc
backup_and_link $HOME/.vim            $DCO_PATH/packages/vim/.vim
backup_and_link $HOME/.bashrc         $DCO_PATH/packages/bash/.bashrc
backup_and_link $HOME/.bash_aliases   $DCO_PATH/packages/bash/.bash_aliases

