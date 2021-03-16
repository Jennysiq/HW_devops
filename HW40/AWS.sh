#!bin/bash
aws ec2 create-launch-template \
   --launch-template-name Devops-lt \
   --version-description Devops-lt-test \
   --launch-template-data '{"NetworkInterfaces":[{"AssociatePublicIpAddress":true,"DeviceIndex":0,"Groups":["sg-0a95397248301a00a"],"SubnetId":"subnet-cd4ed6ec"}],"ImageId":"ami-042e8287309f5df03","InstanceType":"t2.micro","TagSpecifications":[{"ResourceType":"instance","Tags":[{"Key":"Devops","Value":"DevOps1"}]}]}'

aws autoscaling create-auto-scaling-group --auto-scaling-group-name Devops-asg --launch-template "LaunchTemplateName=Devops-lt,Version=1" --min-size 1 --max-size 3 --vpc-zone-identifier "subnet-cd4ed6ec"
aws elbv2 create-load-balancer --name Devops-alb --subnets subnet-cd4ed6ec subnet-cd3b6cc3
aws ec2 create-security-group --group-name my-sg --description "devops-cli-sg" --profile jennysiq
aws ec2 authorize-security-group-ingress --group-id sg-0a95397248301a00a --protocol tcp --port 22 --cidr 87.252.254.202/24