resource "aws_instance" "web01" {
  ami               = "abcd000111xxxbb"
  instance_type     = "t2.micro"
  security_groups   = ["${aws_security_group.mygroup.id}"]
  availability_zone = "eu-west-2" 
}
