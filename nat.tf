#Create an Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
  
  tags = {
    Name = "NAT-EIP"
  }
}

# Create a NAT Gateway
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id #NAT Gateway is placed in the Public Subnet.

  tags = {
    Name = "MyNATGateway"
  }
}

#Update Private Route Table to Use NAT Gateway
resource "aws_route" "private_internet_access" {
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gw.id
}
