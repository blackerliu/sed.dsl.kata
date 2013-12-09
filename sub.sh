#!/bin/sh

for file
do
	echo $file
	mv $file $$.subhld
	sed 's/REPORT/report/g
	     s/FILE/file/g
	     s/PROCESS/process/g' $$.subhld > $file
done
rm $$.subhld
