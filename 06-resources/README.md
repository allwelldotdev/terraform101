# Deployign an NGINX Server in AWS

In this project, I deploy an NGINX server in AWS. I will create a new VPC, set up public and private subnets, and deploy an EC2 instance using the Ubuntu AMI. Later, I will replace the instance with an NGINX Bitnami AMI and associate it with a security group. Finally, I will test the website accessibility and tag the resources with project information.

## Steps for implementation:

1. [DONE] Deploy a VPC and a subnet
2. Deploy an internet gateway and associate it with the VPC
3. Setup a route table with a route to the IGW and associate it with the subnet
4. Deploy an EC2 instance inside of the created subnet and associate a public IP
5. Associate a security group that allows public ingress
6. Change the EC2 instance to use a publicly available NGINX AMI
7. Destroy everything