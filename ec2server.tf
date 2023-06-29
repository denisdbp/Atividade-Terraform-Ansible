terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = "AKIAVN4GBP6YNL6YDJTF"
  secret_key = "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"
}

resource "aws_instance" "WindowsServer" {
  ami           = "ami-0c5bb25c382cdbdfd"
  instance_type = "t2.micro"

  tags = {
    Name = "WindowsServer"
  }
}

resource "aws_key_pair" "ec2_key" {
    key_name   = "terraform-aws"
    public_key = file("server.pub")
}