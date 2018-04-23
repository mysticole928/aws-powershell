# This will stop an instance tagged with a Name of EC2-INSTANCE-NAME.

$INSTANCE = (aws ec2 describe-instances --filter 'Name=tag:Name,Values=EC2-INSTANCE-NAME') -join "" | ConvertFrom-Json
$VOL_ID = $INSTANCE.Reservations.Instances.BlockDeviceMappings.Ebs.VolumeId
$INSTANCE_ID = $INSTANCE.Reservations.Instances.InstanceId
$INSTANCE.Reservations.Instances.BlockDeviceMappings.Ebs.VolumeId

aws ec2 stop-instances --instance-ids $INSTANCE_ID

# Verify the status of the stop command:

aws ec2 describe-instance-status --instance-ids $INSTANCE_ID
