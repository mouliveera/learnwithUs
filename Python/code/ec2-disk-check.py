import boto3

# Connect to the EC2 service
ec2 = boto3.client('ec2')

# Get the list of all instances
instances = ec2.describe_instances()

# Iterate over the instances and check the disk details
for reservation in instances['Reservations']:
    for instance in reservation['Instances']:
        # Check if the instance is running
        if instance['State']['Name'] == 'running':
            # Get the instance ID
            instance_id = instance['InstanceId']
            # Get the disk details
            disk_info = ec2.describe_volumes(Filters=[{'Name': 'attachment.instance-id', 'Values': [instance_id]}])
            for disk in disk_info['Volumes']:
                print("Disk ID: ", disk['VolumeId'])
                print("Disk Type: ", disk['VolumeType'])
                print("Disk Size: ", disk['Size'])
                print("Disk Availability Zone: ", disk['AvailabilityZone'])
                print("Disk Encryption: ", disk['Encrypted'])

