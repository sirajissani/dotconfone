#!/bin/bash
## Initialize the dotconfone structure

# 1. Create directory structure to store all config files currently in use. 
# 2. Create lookup for default paths for commissioning the config files
# 3. Convert the existing file on the default paths to soft links, linking
#    to the files store in the dotconfone structure.
# 4. If the files do not exist, check the installation status of the package
# 5. Install the packages in the list and run the conversion in 3.
#


CPCMD='cp -v'
CPDIR='cp -vr'
MKDIR='mkdir -p'

USERHOME='~'
LOGFILE='./log'

PKGWITHCONF=`cat packageswithconf.list`

echo "" > $LOGFILE
echo "################################################################"     >> $LOGFILE
echo "Started running $0 at `date`"                                         >> $LOGFILE
echo "################################################################"     >> $LOGFILE

# Make dotconfone package structure
$MKDIR $PKGWITHCONF

# Copy the conf files from default location to dir

# bash
$CPCMD ${USERHOME}/.bashrc bash/                                            >> $LOGFILE
$CPCMD ${USERHOME}/.bash_aliases bash/                                      >> $LOGFILE

# zsh
$CPCMD ${USERHOME}/.zshrc zsh/                                              >> $LOGFILE

# vim
$CPCMD ${USERHOME}/.vimrc vim/                                              >> $LOGFILE
$CPDIR ${USERHOME}/.vim vim/                                                >> $LOGFILE

# feh
$CPCMD ${USERHOME}/.fehrc feh/                                              >> $LOGFILE

# mediatomb
$CPCMD ${USERHOME}/.mediatomb/config.xml mediatomb/                         >> $LOGFILE

# samba
$CPCMD /etc/samba/smb.conf.master samba/                                    >> $LOGFILE

# apache2
$CPDIR /etc/apache2/* apache2/                                              >> $LOGFILE

# vsftpd
$CPCMD /etc/vsftpd.conf vsftpd                                              >> $LOGFILE

# mplayer
$CPDIR ${USERHOME}/.mplayer mplayer/                                        >> $LOGFILE

# mpd
$CPCMD /etc/mpd.conf mpd/                                                   >> $LOGFILE
$CPCMD /etc/mpdscribble.conf mpd/                                           >> $LOGFILE


echo "Stopped at `date`"                                                    >> $LOGFILE
echo "################################################################"     >> $LOGFILE

