#!/bin/bash

image_name=royroque/vncffwatir
stack_name=vncffwatir
vol_mach_name=datavol
linked_mach_name1=ruby193rails3
linked_mach_name2=j17p7adm
linked_mach_name3=j17p7dep

docker run -d --volumes-from=$vol_mach_name \
            --link $linked_mach_name1:$linked_mach_name1  \
            --link $linked_mach_name2:$linked_mach_name2  \
            --link $linked_mach_name3:$linked_mach_name3  \
            --name $stack_name -h $stack_name \
            -p 5901:5901 -e USER=root \
            $image_name 

echo "`docker inspect $stack_name |grep -i IPADDR`      $stack_name"
