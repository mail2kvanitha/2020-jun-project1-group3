# VPC
resource "aws_vpc" "vpc" {
  cidr_block  = var.CIDRBlock
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_internet_gateway" "InternetGW" {
    vpc_id = aws_vpc.vpc.id
}

resource "aws_eip" "IPADDR" {
	 vpc      = true
}




