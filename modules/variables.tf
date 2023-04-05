variable "lb-name" {}
variable "lb-sg" {
  type = list(string)
}
variable "tg-name" {}
variable "ec2-sg" {}
variable "az" {
  type = list(string)
}
variable "pub-key-path" {
  type = string
}
variable "my-ip" {
  type = list(string)
}
variable "ec2-sg" {
  type = list(string)
}
variable "az" {
  type = string
  default = "eu-west-2" 
}
variable "root_password" {}
