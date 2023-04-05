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

}

resource "aws_instance" "webapp" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = "mykey"
  availability_zone = var.az
  provisioner "file" {
    source      = "./scripts/tomcat.sh"
    destination = "/tmp/tomcat.sh"
  }
  connection {
    type     = "ssh"
    user     = "ubuntu"
    password = var.root_password
    host     = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/tomcat.sh",
      "/tmp/tomcat.sh"
    ]
  }
  vpc_security_group_id = var.ec2-sg
  tags = {
    Name = "webapp"
  }
}


