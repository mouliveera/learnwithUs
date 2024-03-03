#!/bin/bash

# Infinite loop to display hostname
while true; do
    echo "Hello $CONTAINER_USER!"
    echo "You are currently on host: $(hostname)"
    echo "Current date and time: $(date)"
    echo "------"
    sleep 1
done
