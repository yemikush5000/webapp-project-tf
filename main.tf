resource "aws_instance" "web01" {
  ami               = "abcd000111xxxbb"
  instance_type     = "t2.micro"
  tenancy           = "shared"
  vpc_id            = "a012b345kj24"
  availability_zone = "eu-west-2a"
}
