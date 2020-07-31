
output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnets" {
  value = [
    {
      availability_zone = aws_subnet.public_subnet1.availability_zone
      cidr_block        = aws_subnet.public_subnet1.cidr_block
    },
    {
      availability_zone = aws_subnet.public_subnet2.availability_zone
      cidr_block        = aws_subnet.public_subnet2.cidr_block
    }
  ]
}

output "private_subnets" {
  value = [
    {
      availability_zone = aws_subnet.private_subnet1.availability_zone
      cidr_block        = aws_subnet.private_subnet1.cidr_block
    },
    {
      availability_zone = aws_subnet.private_subnet2.availability_zone
      cidr_block        = aws_subnet.private_subnet2.cidr_block
    }
  ]
}