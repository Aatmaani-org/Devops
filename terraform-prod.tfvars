# EC2 Variable

AWS_EC2_Region = "us-west-2"

instance_type_ec2 = "t3.medium"

AMI = {
     us-west-2 = "ami-0892d3c7ee96c0bf7"
}

key_name = "team"

# EKS Variables

instance_type_eks = "t3.medium"

capacity_type_eks = "SPOT"

desired_size = 1

max_size = 5

min_size = 1

max_unavailable = 1

# ECR Varibles


repository_name = "nodejs-repository"
 
attach_lifecycle_policy = false
