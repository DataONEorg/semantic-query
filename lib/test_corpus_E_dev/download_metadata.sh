#!/bin/bash 

urlhead='https://cn.dataone.org/cn/v1/object/';

encrypted_id=`/usr/bin/python -c "import sys, urllib as ul;print ul.quote_plus(sys.argv[1])" $1`;

url=$urlhead$encrypted_id;

echo $url;

wget -O science_metadata/$encrypted_id $url


# paste on this header: https://cn.dataone.org/cn/v1/object/{pid}
# eg, cn.dataone.org/cn/v1/object/doi:10.5063/AA/knb.92.1
