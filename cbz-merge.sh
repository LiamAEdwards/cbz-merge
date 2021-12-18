#!/bin/bash

echo "Enter absolute path to the directory you wish cbz-merge to run. - Example /home/USER/directory/subdirectory"
read directory
basedir=$(basename $directory)

echo $directory
unzip "$directory/*.cbz" -d "$directory" | tee -a cbz-merge.log
zip -r "$directory/$basedir.cbz" "$directory/" -x "*.cbz" | tee -a cbz-merge.log

# Convert cbz for e-reader
ebook-convert $directory/$basedir.cbz $directory/$basedir.mobi | tee -a cbz-merge.log
