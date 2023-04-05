resource "aws_key_pair" "webapp" {
  key_name   = "mykey"
  public_key = file(var.pub-key-path)
}
