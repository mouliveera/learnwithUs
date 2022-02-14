#!/bin/bash

if [[ 2 -gt 3 ]] || [[ 4 -gt 5 ]] || [[ $1 == "MOULI" ]]; then
	echo "SUCCESS";
else
	echo "FAILURE";
fi
