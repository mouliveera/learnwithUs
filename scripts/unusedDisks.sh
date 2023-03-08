#!/bin/bash
PROJECT=${1:-rep-eng-e2e}
gcloud compute disks list --project $PROJECT --filter="-users:*" | awk 'NR>1 {print}' | 
while read line; 
    do 
    echo $line;
    if [[ $(echo $line |awk '{print $3}') == "region" ]]; then 
        REGION=$(echo $line |awk '{print $2}') 
        gcloud compute disks describe $(echo $line |awk '{print $1}') --project $PROJECT --region $REGION |grep description | awk -F, '{print $2}'; 
        echo "========================"; 
        echo ; 
    else
        ZONE=$(echo $line |awk '{print $2}')
        gcloud compute disks describe $(echo $line |awk '{print $1}') --project $PROJECT --zone $ZONE |grep selfLink | awk -F/ '{print $NF}';
        echo "========================"; 
        echo ; 
    fi ; 
    done