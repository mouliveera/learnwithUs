PROJECT="${1:-rep-eng-e2e}"
TMPFILE=$(mktemp /tmp/unUsedDisks-XXX)

# Get list of unUsed disks
function ListUnusedDisks() {
    gcloud compute disks list --project=$PROJECT --filter="-users:*"
}
ListUnusedDisks > $TMPFILE

cat $TMPFILE

if [[ -z $TMPFILE ]]; then
    echo "All DISKS are healthy and Bound..!"
fi

echo "List UnUsedDisks in $PROJECT:"
echo "------------------------------"
ListUnusedDisks
echo "------------------------------\n"


#ListUnusedDisks > $TMPFILE

cat $TMPFILE
NoUseDisks=$(cat $TMPFILE|grep -v NAME |wc -l)

if [[ -z $TMPFILE ]]; then
    echo "All DISKS are healthy and Bound..!"
fi
echo "In Total, there are $NoUseDisks noUse disks in the project:  $PROJECT"
echo "------------------------------\n"

echo "Re-Verify whether the disk is still in USE or NO"

# Iterate over the ListUnusedDisks
cat $TMPFILE |grep -iv NAME | while read line;
    do 
    NAME=$(echo $line|awk '{print $1}');
    LOCATION=$(echo $line|awk '{print $2}');
    LOCATION_SCOPE=$(echo $line|awk '{print $3}');
    if [[ "$LOCATION_SCOPE" == "region" ]]; then
        DetachDate=$(gcloud compute disks describe $NAME --project $PROJECT --region $LOCATION |grep lastDetachTimestamp |awk '{print $2}');
        if [[ $DetachDate ]]; then
            echo "DISK: $NAME is not longer being used, DetachDate: ${DetachDate}"
            echo "Shall i proceed to DELETE? [Y/n]: ";
            read input
            case $input in 
                [[yY][eE][sS]|[yY])
                    echo "Deleting: DISK $NAME from project $PROJECT";
                    echo "gcloud compute disks delete ${NAME} \
                    --region=${LOCATION} \
                    --project=${PROJECT} \
                    --quiet"
                    shift
                    ;;
                [nN][oO]|[nN])
                    echo "You say No"
                    shift
                    ;;
                *)
                    echo "Invalid input..."
                    exit 1
                    shift
                    ;;
            esac


 #           if [[ $input == "yes" ]]; then
 #               echo "Deleting: DISK $NAME from project $PROJECT"
 #               echo "gcloud compute disks delete ${NAME} \
 #                   --region=${LOCATION} \
 #                   --project=${PROJECT} \
 #                   --quiet"
 #           elif [[ "$input" == "no" ]]; then
 #               echo "No action taken on DISK $NAME in project $PROJECT"
 #           fi
        else
            echo "Looks DISK: $NAME, still in USE. Please verify in GOOGLE CLOUD console";
        fi

    elif [[ "$LOCATION_SCOPE" == "zone" ]]; then
        DetachDate=$(gcloud compute disks describe $NAME --project $PROJECT --zone $LOCATION |grep lastDetachTimestamp |awk '{print $2}');
        if [[ $DetachDate ]]; then
            echo "DISK: $NAME is not longer being used, DetachDate: ${DetachDate}";
            echo "Shall i proceed to DELETE (yes/no): "
            read input
            if [[ "$input" == "yes" ]]; then
                echo "Deleting: DISK $NAME from project $PROJECT"
                echo "gcloud compute disks delete ${NAME} \
                    --zone=${LOCATION} \
                    --project=${PROJECT} \
                    --quiet"
            elif [[ "$input" == "no" ]]; then
                echo "No action taken on DISK $NAME in project $PROJECT"
            fi
        else
            echo "Looks DISK: $NAME, still in USE. Please verify in GOOGLE CLOUD console";
        fi
    fi
    done



