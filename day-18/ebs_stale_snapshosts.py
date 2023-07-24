import boto3

def lambda_handler(event, context):
    ec2 = boto3.client('ec2')
    
    # Get all EBS snapshots
    response = ec2.describe_snapshots(OwnerIds=['self'])
    
    # Get all active EC2 instance IDs
    instances_response = ec2.describe_instances(Filters=[{'Name': 'instance-state-name', 'Values': ['running', 'stopped']}])
    active_instance_ids = set()
    
    for reservation in instances_response['Reservations']:
        for instance in reservation['Instances']:
            active_instance_ids.add(instance['InstanceId'])
    
    # Iterate through each snapshot and delete if it's stale
    for snapshot in response['Snapshots']:
        snapshot_id = snapshot['SnapshotId']
        if 'VolumeId' in snapshot and snapshot['VolumeId'] not in active_instance_ids:
            ec2.delete_snapshot(SnapshotId=snapshot_id)
            print(f"Deleted stale EBS snapshot {snapshot_id}.")