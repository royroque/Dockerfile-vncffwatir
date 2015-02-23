#!/bin/bash
if [ -z "$1" ]
  then
    echo "Usage: $0 <name_of_image>"
    exit
fi
image_name=$1
stack_name=vncffwatir
linked_mach_name1=j17p7adm
linked_mach_name2=j17p7dep
vol_mach_name=datavol

docker rm -f $stack_name >/dev/null 2>&1
docker run -d --volumes-from=$vol_mach_name \
            --link $linked_mach_name1:$linked_mach_name1  \
            --link $linked_mach_name2:$linked_mach_name2  \
            --name $stack_name -h $stack_name \
            -p 5901:5901 -e USER=root \
            $image_name 

echo "`docker inspect $stack_name |grep -i IPADDR`      $stack_name"
