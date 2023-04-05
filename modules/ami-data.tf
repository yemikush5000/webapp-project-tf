data "aws_ami" "centos7" {
  filter {
    name   = "name"
    values = ["*CentOS*7*"]
  }

  filter { 
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter { 
    name   = "owner-id"
    values = ["aws-marketplace"]
  }
  filter { 
    name   = "architecture"
    values = ["x86_64"]
  }
}
