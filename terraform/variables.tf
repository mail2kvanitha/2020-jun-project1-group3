# Variables for the entire stack goes here.

variable "aws_region" {
  type    = string
  default = "ap-southeast-2"
}

variable "CIDRBlock" {
  description = "VPC network"
  default     = "20.0.0.0/16"
}