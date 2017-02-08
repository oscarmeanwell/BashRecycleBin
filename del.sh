#! /bin/bash
# 40201136

fName=""

# function to move file to ~/dustbin
function cp_Files {
	if [ ! -f $fName ]; then
		#if file does not exist
		echo "There is no file: $fName"
	else
		#if file exists move to dustbin
		mv $fName ~/dustbin
		readlink -f $fName >> ~/dustbin/.orgpaths.txt
		echo "Deleting File: $(readlink -f $fName)"
	fi
}
if [ ! -d ~/dustbin ]; then
	mkdir ~/dustbin
	echo "mkdir: Creating directory 'dustbin'"
fi

if [ $# -eq 0 ]; then
	echo "Usage: del <filepath> [filepath]"

else

	# Loop through arguments and call cp_Files
	for j in "$@"; do
		fName=$j
		cp_Files	
	done
fi
