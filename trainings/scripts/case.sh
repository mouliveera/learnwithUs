#!/bin/bash

## CASE STATEMENT
echo -e "Enter name: \c"
read name

case $name in
	mouli)
	echo "You entered Mouli"
	;;
	sudheer)
	echo "You entered Sudheer"
	;;
	sukesh)
	echo "You entered Sukesh"
	;;
	ganesh)
	echo "You entered Ganesh"
	;;
	*)
	echo "You entered a new name!"
	;;
esac
