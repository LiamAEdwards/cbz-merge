#!/bin/bash

echo "Enter directory you wish to run cbz-merge. - Example directory/subdirectory"
read directory
currentDir=${PWD##*$directory}   
echo $currentDir/
echo $directory
unzip "$currentDir/$directory/*.cbz" -d $currentDir/$directory 
zip -r "$currentDir/$directory.cbz" $currentDir/$directory/* -x "*.cbz"

