terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-024e6efaf93d85776"
  instance_type = "t2.micro"
  key_name= "iac-treinamento"
  user_data = <<-EOF
                #!/usr/bin/bash
                cd /home/ubuntu
                echo "<h1>Feito com Terraform</h1>" > index.html
                nohup busybox hhtpd -f -p 8080 &
                EOF
                 
              
  tags = {
    Name = "teste-serv"
  }
}