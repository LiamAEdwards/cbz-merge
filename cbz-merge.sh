#!/bin/bash

echo "Enter absolute path to the directory you wish cbz-merge to run. - Example /home/USER/directory/subdirectory"
read directory

echo $directory
unzip "$directory/*.cbz" -d "$directory"
zip -r "$directory.cbz" "$directory/" -x "*.cbz"
