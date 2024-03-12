# Demo for 2-tier app in Private subnet or VPC with public-private subnet in Production

## About the Project
This is example demonstrates how to create a VPC that you can use for servers in a Production Environment.

To improve resilliency, you deploy the servers in two Availibilty zones, by using an Autoscalling group and an Application Load balancer. For additional security you deploy the server in private subnets. The server receives requests through the load balancer. The servers can connect to the internet by using NAT gateway. To improve resilliency, you deploy the NAT gateway in both resilliency, you deploy the NAT gateway in both availibility zones.

## OverView
- The VPC has public subnets & private subnets in two availibilty zones.
- Each public subnets contains a NAT gateway and load-balancer node.
- The servers runs in the private subnets, are launched and terninated by using an auto-scalling group and recieve traffic from the load-balancer.
= The servers can connect to the internet by using NAT gateway.

In this project we use -
- Auto-Scaling Group
- Load-balancer
- Target Group
- Bastion host or jump server.

# Let's start the project:

## Creation of VPC
- Go to AWS console -> VPC and click on it.
- Click on create VPC and click on VPC and more (AWS creates all the resources)
- Give name of the project (Like: AWS-Prod_Example)
- IP: leave it by-default.
- Select No IPV6 CIDR block.
- No. of availibilty zone:2.
- No. of public subnet:2.
- No. of private subnet:2.
- NAT gateway: 1perAZ.
- VPC endpoints: none (if you want S3 gateway then click on it)
- Click on Create VPC.
- Go to VPC and Create it.

## Creation of Auto-Scaling Group
- Go to EC2 and go to Autoscaling group in left side-bar and click on it.
- Click on create Auto-scaling Group.

#### Firstly click on Create Launch template
- Give template name (like: aws-prod-example)
- Template description (proof of concept for app deploy for AWS private subnet).
- Choose the AMI: click on recently added or browse more AMI for which you want to create.
- Instance type: select free instance (t2.micro)
- Select keyvalue pair or create new pair key.
- In networking:
1. click on new Security group.
2. Give security group name: aws-prod-exapmle.
3. Description: allow SSH access
4. VPC: attach VPC that you are created above.
5. Add inbound security group a/c to your requirement 'like: ssh port or port:8000[application running port]'.
- click on create launch template.

#### Go on Auto-Scaling group
- Give a name for Auto-Scaling group (aws-prod-example).
- Select template that you are created.
- Click on next.
- Select VPC that you created.
- Select Private Subnets.
- Click on next & then next & select desired capacity-2, maximum capacity-4.
- click on next then again next.. and then Launch config.
**Note: Go to EC2 & verify the instances that are created or not.**

**Now You have install applications in the instances.**

## creation on Bastion host
- Go to AWS console -> Click on EC2 -> Click on Launch instance.
- Give a server/instance name(bastion-host).
- Choose ubuntu image or choose image that you want to create.
- choose instance type as t2.micro 
- choose key pair or create new one.
- Network setting:
1. Attach same VPC in which private instance is created.
2. Select public subnet.
3. Select Auto-Scaling IP- Enable.
4. Add SSH PORT.
- Go and Launch Instance.
**Note: From bastion host we SSH into Private Instances.**

## LogIn into EC2 instance
- SSH in bastion host instance.
- For SSH in private instance we need 'key' in the bastion host so we copy the key from local host to bastion host.
- The command is used to copy is: 'scp -i path_of_key/keyName path_of_remote/keyName username@<ip of bastion server>:/home/username'
- Check the file is copy or not in bastion host.

#### LogIn to Private instance
- ssh -i path_/key_name username@<ip of private instance>
**Now install the application in your instances**

## Final stage: Create a load-blancer
- Go to EC2 & clock on load-balancer present in left side-bar.
- Click on create Application load-balancer.
- Give load-balancer name(aws-prod-example) **It should be present in public subnet**
- Click on internet facing and IPV4
- Select same VPC in private instances is created and attach to it.
- Select security group a/c to requirement.

#### Click on target group
- select instance.
- Target group name: (aws-prod-example)
- Protocol: http:8000
- click on next & select private EC2 instances
- click include as pending.

**Refresh the load-balancer page and configure it with above steps**

- select target group.
- create the load-balancer.

When the loadbalancer is created Copy the ip of it and browse it

"Congratulations! you have successfully complete this project"

 



