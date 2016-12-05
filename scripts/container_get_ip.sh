#!/bin/sh

get_container_ip() {
    echo $(docker inspect $1 | python -c 'import json,sys;obj=json.load(sys.stdin);print obj[0]["NetworkSettings"]["IPAddress"]')
}

case "$1" in
    --install) cp container_get_ip.sh /bin/container_get_ip
	       chmod +x /bin/container_get_ip
	       cp container_get_ip.sh /sbin/container_get_ip
	       chmod +x /sbin/container_get_ip
	       ;;
    *) get_container_ip $1
       ;;
esac
