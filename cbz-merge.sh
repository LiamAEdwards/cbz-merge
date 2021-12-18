#!/bin/bash

echo "Enter absolute path to the directory you wish cbz-merge to run. - Example /home/USER/directory/subdirectory"
read directory

# For setting the correct name of the output .cbz file
basedir=$(basename $directory)

# Unzip and zip
unzip $directory/*.cbz -d $directory 
zip -r $directory/$basedir.cbz $directory/* -x "*.cbz"
