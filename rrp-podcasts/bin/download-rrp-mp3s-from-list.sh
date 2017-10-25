#!/bin/bash
i=1
while read line
do
#	if [ $i -eq 5 ]
#	then
#		break
#	fi
#	echo $line
#	i=$((i+1))

	# find link to download page
	link=$( echo $line | sed 's/^.*href="\(.*\)"\ rel.*$/\1/')
	name=$( echo $link | sed 's/^.*podcast\/\(.*\)\/$/\1/')
#	echo $name

	# get download page
	page=$(wget $link -q -O -)

	# find the  target download line
	target=$(grep 'Download Podcast' <<< "$page")

	# find the mp3 download link
	mp3=$(echo $target | sed 's/^.*href="\(.*\)"\ class.*$/\1/')
#	echo $mp3

	# generate the names of the out file
	tmp=$( echo $mp3 | sed 's/^.*richroll\-\(.*\)/\1/')
	file=$( echo $tmp | sed "s/.mp3/\-$name\.mp3/")

	echo $file

	# download the  target
	wget $mp3 -q -O - > "../$file"

done < podcasts-to-download.list
