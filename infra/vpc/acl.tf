# Network ACL
# 2 NACLs public/private (ALLOW ALL is not permitted)
resource "aws_network_acl" "acl" {
	vpc_id = aws_vpc.vpc.id
	subnet_ids = [aws_subnet.public_subnet1.id,aws_subnet.public_subnet2.id]
	ingress {
		protocol = "tcp"
		rule_no = 100
		action = "allow"
		cidr_block = "0.0.0.0/0"
		from_port = 80
		to_port = 80
		}
	ingress {
		protocol = "tcp"
		rule_no = 110
		action = "allow"
		cidr_block = "0.0.0.0/0"
		from_port = 443
		to_port = 443
		}
  	egress {
    		protocol   = -1
    		rule_no    = 100
    		action     = "allow"
    		cidr_block = "0.0.0.0/0"
    		from_port  = 0
    		to_port    = 0
  }
	tags =	{	
		Name = "Acl Publ"
		}
}
resource "aws_network_acl" "private_acl" {
	vpc_id = aws_vpc.vpc.id
	subnet_ids = [aws_subnet.private_subnet1.id,aws_subnet.private_subnet2.id]
	ingress {
    		protocol   = -1
    		rule_no    = 90
    		action     = "allow"
    		cidr_block = "180.150.58.136/32"
    		from_port  = 0
    		to_port    = 0
  }
	ingress {
		protocol = "tcp"
		rule_no = 95
		action = "allow"
		cidr_block = cidrsubnet(var.CIDRBlock, 8, 1)
		from_port = 3306
		to_port = 3306
		}
	ingress {
		protocol = "tcp"
		rule_no = 96
		action = "allow"
		cidr_block = cidrsubnet(var.CIDRBlock, 8, 3)
		from_port = 3306
		to_port = 3306
		}
	ingress {
		protocol = "tcp"
		rule_no = 110
		action = "allow"
		cidr_block = var.CIDRBlock
		from_port = 443
		to_port = 443
		}
	ingress {
		protocol = "tcp"
		rule_no = 120
		action = "deny"
		cidr_block = "0.0.0.0/0"
		from_port = 80
		to_port = 80
		}
	ingress {
		protocol = "tcp"
		rule_no = 130
		action = "deny"
		cidr_block = "0.0.0.0/0"
		from_port = 443
		to_port = 443
		}
	egress {
		protocol = "tcp"
		rule_no = 95
		action = "allow"
		cidr_block = cidrsubnet(var.CIDRBlock, 8, 1)
		from_port = 3306
		to_port = 3306
		}
	egress {
		protocol = "tcp"
		rule_no = 96
		action = "allow"
		cidr_block = cidrsubnet(var.CIDRBlock, 8, 3)
		from_port = 3306
		to_port = 3306
		}
	egress {	
		protocol = "tcp"
		rule_no = 100
		action = "allow"
		cidr_block = "0.0.0.0/0"
		from_port = 80
		to_port = 80
		}
	egress {
		protocol = "tcp"
		rule_no = 110
		action = "allow"
		cidr_block = "0.0.0.0/0"
		from_port = 443
		to_port = 443
		}
	tags =	{	
		Name = "Acl Prv"
		}
}
