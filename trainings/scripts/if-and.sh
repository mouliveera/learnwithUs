#!/bin/bash

if [[ 5 -gt 3 ]] && [[ 4 -gt 3 ]] && [[ $1 == "MOULI" ]]; then
	echo "SUCCESS";
else
	echo "FAILURE";
fi
