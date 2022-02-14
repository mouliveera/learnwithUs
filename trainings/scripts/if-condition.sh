#!/bin/bash

echo "Enter name: \c"
read name

if [[ $name == "mouli" ]]; then
	echo "You entered Mouli";
elif [[ $name == "sudheer" ]]; then
	echo "You entered Sudheer";
elif [[ $name == "sukesh" ]]; then
	echo "You entered Sukesh";
elif [[ $name == "ganesh" ]]; then
	echo "You entered Ganesh";
else
	echo "You entered a new name!"
fi
