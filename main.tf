provider "aws" {
  region = "ap-south-1" # Change to your preferred region
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0360c520857e3138f" # Ubuntu 20.04 in ap-south-1 (example, update for your region)
  instance_type = "t2.micro"

  # Create a new key pair or use an existing one
  key_name = "aws-login2"

  tags = {
    Name = "MyTerraformInstance"
  }
}
