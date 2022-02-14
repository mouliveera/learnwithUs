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
# : '
# Hi mouli How are you.
# echo test
# ls -l
# '

if [ $age -le 10 ]; then
	echo "Child age";
elif [ $age > 10 ] || [ $age <= 20 ]; then
	echo "YOUNG age";
fi
