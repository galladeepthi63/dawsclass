#!/bin/bash

SOURCE_DIRECTORY = /tmp/shell-script-log 

if [! -d $SOURCE_DIRECTORY]
    then
        echo -e "Source directory : $SOURCE_DIRECTORY does not exist"
fi

FILE_TO_DELETE=$(find . $SOURCE_DIRECTORY -type f -mtime +14 -name "*.log")

while IFS= read -r line 
do 
    echo "Deleting files :$line"
done <<< $FILE_TO_DELETE
