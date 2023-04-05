resource "aws_instance" "memcache" {
  ami           = data.aws_ami.centos7.id
  instance_type = "t2.micro"
  key_name = "mykey"
  availability_zone = var.az
  provisioner "file" {
    source      = "./scripts/memcache.sh"
    destination = "/tmp/memcache.sh"
  }
  connection {
    type     = "ssh"
    user     = "centos"
    password = var.root_password
    host     = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x memcache.sh"
      "/tmp/memcache.sh"
    ]
  }
  vpc_security_group_id = var.ec2-sg
  tags = {
    Name = "memcache"
   }
}

