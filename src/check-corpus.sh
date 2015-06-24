#!/bin/sh
# Script checks if IDs from a corpus list exist in a DataONE repo

# usage
USAGE='     USAGE: check-corpus.sh filename_with_ids';
if [ $# -ne 1 ]; 
    then echo;echo "$USAGE"; echo;
    exit;
fi


BASEURL=https://cn-sandbox-2.test.dataone.org/cn/v1/meta/

# get the list to check
filename=$1;

for ID in `cat $filename` ; do
	#echo "Processing: " ${ID}
	NOTFOUND=`curl -s ${BASEURL}${ID} | grep -c "NotFound"`
	if [[ "$NOTFOUND" -gt "0" ]] ; then
		echo ${NOTFOUND} $ID
	fi
done
