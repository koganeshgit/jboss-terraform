variable "availability_zone" {
  default = "us-east-1a"
}

variable "ami" {
  description = "Amazon Machine Image for the Instance"
  default     = "ami-011b3ccf1bd6db744"
}

variable "inst_type" {
  description = "type of instances to provision"
  default     = "t2.micro"
}
variable "key_name" {
  default = "jenkins"
}
variable "vpc_public_sg_id" {
  description = "VPC public security group"
  default     = "sg-09cb605841fb3cf16"
}

variable "vpc_public_sn_id" {
  description = "VPC public subnet"
  default     = "subnet-d25e6898"
}

variable "vpc_region" {
  description = "VPC region"
  default     = "us-east-1"
}

