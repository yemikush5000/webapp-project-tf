resource "aws_instance" "db" {
  ami           = data.aws_ami.centos7.id
  instance_type = "t2.micro"
  key_name = "mykey"
  availability_zone = var.az
  provisioner "file" {
    source      = "./scripts/mysql.sh"
    destination = "/tmp/mysql.sh"
  }
  connection {
    type     = "ssh"
    user     = "centos"
    password = var.root_password
    host     = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/mysql.sh"
      "/tmp/mysql.sh"
    ]
  }
  vpc_security_group_id = var.ec2-sg
  tags = {
    Name = "db"
  }
}


