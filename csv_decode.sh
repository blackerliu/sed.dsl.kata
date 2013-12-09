#!/bin/bash
# decode csv format file ,convert each field to a single line
# by LiuJianhua

if [[ $# -ne 1 ]];then
	echo "Usage: $0  csv_file"
	exit 1
fi

input_csv_file=$1

if [ -s $input_csv_file ];then 
	sed '1d' $input_csv_file |sed 's/""\([^",]\)/!|!\1/g; s/\([^"]\)""/\1!|!/g' | sed 's/^[^,]*,/#RECORD\n/g' | sed 's/,\("[^"]*"\)/\n\1/g' |sed 's/\("[^"]*"\),/\1\n/g' | sed '/^[^"]/ s/,/\n/g' |sed 's/^"\([^"]*\)"$/\1/g' |sed 's/!|!/"/g' |sed 's/^"//g'
else
	echo "Cannot find csv file $input_csv_file"
fi
