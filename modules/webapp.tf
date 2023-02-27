data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["529011907288"] 
}

resource "aws_instance" "webapp" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = "mykey"
  user_data =
  availability_zone = "eu-west-2a"
  vpc_security_group_id = []
  tags = {
    Name = "webapp"
  }

resource "aws_key_pair" "webapp" {
  key_name   = "mykey"
  public_key = file("/Users/idowukusoro/mykey.pub")
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"


