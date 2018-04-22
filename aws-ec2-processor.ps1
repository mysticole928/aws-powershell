$INSTANCE = (aws ec2 describe-instances --filter 'Name=tag:Name,Values=Processor') -join "" | ConvertFrom-Json
$VOL_ID = $INSTANCE.Reservations.Instances.BlockDeviceMappings.Ebs.VolumeId
$INSTANCE_ID = $INSTANCE.Reservations.Instances.InstanceId
$INSTANCE.Reservations.Instances.BlockDeviceMappings.Ebs.VolumeId
