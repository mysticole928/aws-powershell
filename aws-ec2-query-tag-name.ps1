# Obtain instance ID of instance tagged with NAME : EC2-INSTANCE-NAME

$INSTANCE = (aws ec2 describe-instances --filter 'Name=tag:Name,Values=EC2-INSTANCE-NAME') -join "" | ConvertFrom-Json
$INSTANCE_ID = $INSTANCE.Reservations.Instances.InstanceId

The AWS CLI Equivalent:  

aws ec2 describe-instances --filters 'Name=tag:Name,Values=EC2-INSTANCE-NAME' --query 'Reservations[0].Instances[0].InstanceId'
