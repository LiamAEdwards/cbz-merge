#!/bin/bash

# Read directory input
echo $1 $2
cd $2


if [ $# -eq 0 ]; then
        echo "No arguments specified"       
	exit 1
fi

if [ $2 == ""]; then
        echo "No directory specified"
        exit 1
fi
basedir=$(basename $2)

while [ "$1" != "" ]; do
    case $1 in
    -j | --jpeg)
        ## START --jpeg LOGS
        zip -r "$basedir.cbz" * -x "*.cbz" | tee -a cbz-merge.log
        ## END --jpeg LOGS
        ;;
    -h | --help)
        ## PRINT HELP MENU
        ;;
    -z | --zip)
        ## START --zip LOGS
        ## UNZIP
        unzip "*.cbz" -d . | tee -a cbz-merge.log
        ## ZIP
        zip -r "$basedir.cbz" * -x "*.cbz" | tee -a cbz-merge.log
        ## END --zip LOGS
        break
        ;;
    esac
done

echo "Merge has been complete, do you want to convert to mobi? Y/N"
read input

if [ $input == "Y" ]; then
        ebook-convert $basedir.cbz $basedir.mobi | tee -a cbz-merge.log
else
        echo "Exiting"
        exit 1
fi

