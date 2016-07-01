# grab
a short  and simple script to download (grab) files off the directory listing of a given website.

Usage:
./grab.sh http://foo.com/directory

It creates a directory and log file at ${HOME}/logs/grab/grab.log

It will also compare the given URL to the log file to see if you've grabbed this site before, and give you an option to continue anyways or exit.

The default download directory is "/cygdrive/f/TEMP/". Be sure to update this to wherever you want to store the contents of the website. 

It uses wget with the following options:

1. -e robots=off 
 * This tells wget to ignore robots.txt
2. --recursive
 * This tells wget to scan the current directory and all subdirectories 
3. --no-parent
 * This tells wget to not follow the link to the parent directory
4. --reject="index.html*"
 * This doesn't download index.html files
5. --user-agent=Mozilla/5.0 
 * A user-agent to send to the website
6. --wait=12 
 * wait 12 seconds (ish)
7. --random-wait 
 * This varies the wait time from *0.5 to *1.5, or 6 to 18 seconds, per --wait=12
8. --directory-prefix=/cygdrive/f/TEMP/
 * The directory to dump into (see note above)
