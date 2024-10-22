#!/bin/bash

read -p "Introdu numele unui folder: " dir 
find=$(find ~/devops2024 -type d -name $dir) 
if [ -n "$find" ]; then
	echo "directory found $find"
	ls -lah $find

else
	mkdir  "$dir"
	echo "Directorul $dir a fost creat"
fi