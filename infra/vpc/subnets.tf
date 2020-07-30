
resource "aws_subnet" "public_subnet1" {
   	 vpc_id            = aws_vpc.vpc.id
   	 cidr_block        = cidrsubnet(var.CIDRBlock, 8, 0)
    	availability_zone = data.aws_availability_zones.available.names[0]
	map_public_ip_on_launch = true
    	tags = {
       	Name = "public_subnet1"
       	Tier = "public"
    	}
}

resource "aws_subnet" "private_subnet1" {
   	 vpc_id            = aws_vpc.vpc.id
    	cidr_block        = cidrsubnet(var.CIDRBlock, 8, 1)
    	availability_zone = data.aws_availability_zones.available.names[0]
    	tags = {
       	Name = "private_subnet1"
       	Tier = "private"
    	}
}

resource "aws_subnet" "public_subnet2" {
    	vpc_id            = aws_vpc.vpc.id
    	cidr_block        = cidrsubnet(var.CIDRBlock, 8, 2)
    	availability_zone = data.aws_availability_zones.available.names[1]
    	map_public_ip_on_launch = true
    	tags = {
       	Name = "public_subnet2"
       	Tier = "public"
    	}
}

resource "aws_subnet" "private_subnet2" {
    vpc_id            = aws_vpc.vpc.id
    cidr_block        = cidrsubnet(var.CIDRBlock, 8, 3)
    availability_zone = data.aws_availability_zones.available.names[1]

    tags = {
       Name = "private_subnet2"
       Tier = "private"
    }
}
