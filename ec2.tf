resource "aws_instance" "terraform_server" {
  instance_type = "t2.micro"
  ami           = "ami-08f7912c15ca96832" 
  key_name      = "terraform"
  tags = {
    name = "example_instance"
  }
}