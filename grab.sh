#!/bin/bash

#Make the directory for Grab logs if it doesn't exist yet
if [ ! -d "${HOME}/logs/grab" ]; then
	echo "Grab logs folder not found! Creating it now."
	mkdir -p "${HOME}/logs/grab"
fi

#Make the log file for Grab if it doesn't exist yet
if [ ! -f "${HOME}/logs/grab/grab.log" ]; then
	echo "Grab logs file not found! Creating it now."
	touch "${HOME}/logs/grab/grab.log"
fi

#Have we grabbed this site yet? Let's check the logs and go from there.
a=$(grep -rnw "${HOME}/logs/grab/grab.log" -e "$1" | wc -l)
b=0
if [ "${a}" -gt "${b}" ]; then 
	echo "I think you already grabbed this site."
	while true; do
    read -rp "Do you wish to continue this grab? [y/n]" yn
    case $yn in
        [Yy]* ) wget -e robots=off --recursive --no-parent --reject="index.html*" --user-agent=Mozilla/5.0 --wait=12 --random-wait --directory-prefix=/cygdrive/f/TEMP/ "$1"; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer [y]es or [no].";;
    esac
done
else 
	echo "This is a new site. Let's grab it!"
	sleep 5
	wget -e robots=off --recursive --no-parent --reject="index.html*" --user-agent=Mozilla/5.0 --wait=12 --random-wait --directory-prefix=/cygdrive/f/TEMP/ "$1"
fi

#Echo site to log
echo "$1" >>"${HOME}/logs/grab/grab.log"

#Sort log and remove duplicates
sort -u "${HOME}/logs/grab/grab.log" -o "${HOME}/logs/grab/grab.log"
