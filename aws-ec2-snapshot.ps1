# Create a snapshot of a volume using PowerShell.
# The instance selected has a tag of Name : EC2-INSTANCE-NAME

$INSTANCE = (aws ec2 describe-instances --filter 'Name=tag:Name,Values=EC2-INSTANCE-NAME') -join "" | ConvertFrom-Json
$VOL_ID = $INSTANCE.Reservations.Instances.BlockDeviceMappings.Ebs.VolumeId

$SNAPSHOT = (aws ec2 create-snapshot --volume-id $VOL_ID) -join "" | ConvertFrom-Json
 
# Report on snapshot status
 
aws ec2 describe-snapshots --snapshot-id $SNAPSHOT.SnapshotId
