#!/bin/sh
######################################################################
## TODO:  create ~/..vnc/passwd on the fly, 
##   for now, create it manually by typing vncpasswd ~/.vnc/passwd
##   then run this command
##   vncviewer <host>:<port> PasswordFile=<full_path_and_filename> &
#######################################################################

vncviewer localhost:5901 PasswordFile=/home/adminuser/.vnc/passwd &
