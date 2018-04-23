# This will create a query based on the VolumeId of Amazon EBS volume

$INSTANCE = (aws ec2 describe-instances --filter 'Name=tag:Name,Values=EC2-INSTANCE-NAME') -join "" | ConvertFrom-Json
$VOL_ID = $INSTANCE.Reservations.Instances.BlockDeviceMappings.Ebs.VolumeId
$INSTANCE_ID = $INSTANCE.Reservations.Instances.InstanceId
$INSTANCE.Reservations.Instances.BlockDeviceMappings.Ebs.VolumeId

aws ec2 describe-instances --filter 'Name=tag:Name,Values=EC2-INSTANCE-NAME' --query 'Reservations[0].Instances[0].BlockDeviceMappings[0].Ebs.{VolumeId:VolumeId}'
 
