#!/bin/sh

# Check if IDs from a corpus list exist in a DataONE repo
BASEURL=https://cn-sandbox-2.test.dataone.org/cn/v1/meta/

for ID in `cat ../lib/test_corpus_C_id_list.txt`; do 
	#echo "Processing: " ${ID}
	NOTFOUND=`curl -s ${BASEURL}${ID} | grep -c "NotFound"`
	if [[ "$NOTFOUND" -gt "0" ]] ; then
		echo ${NOTFOUND} $ID
	fi
done
