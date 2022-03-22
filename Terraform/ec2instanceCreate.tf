#Security-group
resource "aws_security_group" "ssh-allowed" {
    vpc_id = "${aws_vpc.team-vpc.id}"

    egress {
	from_port = 0
	to_port = 0
	protocol = -1
	cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
	from_port = 22
	to_port = 22
	protocol ="tcp"
	cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
	from_port = 80
	to_port = 80
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
	Name = "ssh-allowed"
    }
}

#Variables 

variable "AWS_EC2_Region" {
    description = "EC2 region"
    default = "us-west-2"
}

variable "instance_type_ec2" {
    description = "EC2 instance type"
    default = "t3.medium"
}

variable "AMI" {
    description = "AMI ID"
    type = map
    default = {
        us-west-2 = "ami-0892d3c7ee96c0bf7"
    }
}

variable "key_name" {
    description = "Key pair name"
    default = "team"
}



#EC2-instance

resource "aws_instance" "instance" {
    ami = "${lookup(var.AMI,var.AWS_EC2_Region)}"
    instance_type = var.instance_type_ec2
    key_name = var.key_name
    subnet_id = "${aws_subnet.public-subnet-1.id}"
    vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]
    tags = {
	Name = "Jumpbox"
    }
}






















