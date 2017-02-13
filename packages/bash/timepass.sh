#!/bin/bash

prevline=""
while [ "1" == "1" ];
do
	read -r line
	if [ "$line" == "p" ]; then
		line=$prevline
	fi
	file=`ls /usr/share/games/fortunes/$line* 2> /dev/null | head -n 1`
	if [ "$line" == "o" ]; then
		ls /usr/share/games/fortunes/ -al |grep -v "^total" |grep -v "^d" |grep -Ev "dat|u8" |awk -F" " '{ print $NF }'
		line=""
	else
		if [ "$file" != "" ]; then
			fortune $file
		else
			fortune
		fi
		echo -e "\n\n\n\n\n\n\n\n\n\n"
		prevline=$line
	fi
done

