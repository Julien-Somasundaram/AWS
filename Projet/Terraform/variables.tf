variable "aws_region" {
  description = "The AWS region to deploy in"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "The type of instance to use"
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the SSH key pair"
  default     = "myKey"
}

variable "ami_id" {
  description = "The AMI ID to use for the instance"
  default     = "ami-04b70fa74e45c3917"  
}
