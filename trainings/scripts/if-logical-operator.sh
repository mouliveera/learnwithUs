#!/bin/bash
# Logical AND and OR

## Logical AND
echo -e "Enter your age: \c"
read age
#<
#lt - lessThan
#le - lessThanEqualTo
#>
#gt - greaterThan
#ge - greaterThanEqualTo

#if [ $age -le 10 ] ; then
#  echo "ChildHOOD";
#elif [ $age -gt 10 ] && [ $age -le 30 ]; then
#  echo "Young AGE";
#
#else
#  echo "OldAGE"
#fi
######################

## Logical OR
if [ $age -le 10 ]; then
	echo "Child age";
elif [ $age > 10 ] || [ $age <= 20 ]; then
	echo "YOUNG age";
fi

##
# echo "Enter yes/no: \c"; read opt; if [[ $opt == "yes" ]]; then echo "You choose YES"; elif [[ $opt == "no" ]]; then echo "You CHOOSE no"; else echo "Nothing you choose";fi
#
