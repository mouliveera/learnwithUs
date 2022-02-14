#!/bin/bash

#Case statement

#echo -n "Enter the name of a name: "
#read name
#
#case $name in
#
#  Lithuania)
#    echo -n "Lithuanian"
#    ;;
#
#  Romania | Moldova)
#    echo -n "Romanian"
#    ;;
#
#  Italy | "San Marino" | Switzerland | "Vatican City")
#    echo -n "Italian"
#    ;;
#
#  *)
#    echo -n "unknown"
#    ;;
#esac

###########################
#case $1 in
#	1)
#	echo "You entered 1"
#	;;
#	2)
#	echo "Entered 2"
#	;;
#	*)
#	echo "UNKNOWN"
#	;;
#esac
############################

animal=$1

case $animal in
	cat|dog)
	echo "Domestic animal"
	;;
	tiger|lion)
	echo "Wild animals"
	;;
*)
	echo "Unknown animal"
	;;
esac


