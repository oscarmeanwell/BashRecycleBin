#! /bin/bash
# 40201136
if [ $# -eq 0 ]; then
	echo "Usage: restore <filename>"
	exit
fi
newPath=$(grep $1 ~/dustbin/.orgpaths.txt)
nBP=$newPath.bak
file=$1
fPath=~/dustbin/$1

# If the file does not exists in the dustbin dir
if [ ! -f $fPath ]; then
	echo "File '$file' not found"
else
	#if File exists in dustbin
	# If File to restore already in home dir make .bak file
	if [ -f $newPath ]; then
		echo "Restoring file: $file to $nBP"
		mv "$fPath" "$nBP"		
	else
		echo "Restoring file: $file to $newPath"
		#if file not in home dir, move file
		if [ -d $(dirname $newPath) ]; then
			mv $fPath $newPath
		else
			mkdir $(dirname $newPath)
			mv $fPath $newPath
		fi
	fi
	grep -Ev $file ~/dustbin/.orgpaths.txt > ~/dustbin/new.txt
	rm ~/dustbin/.orgpaths.txt
	mv ~/dustbin/new.txt ~/dustbin/.orgpaths.txt
fi
