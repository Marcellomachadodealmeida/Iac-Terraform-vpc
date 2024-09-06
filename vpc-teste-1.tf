resource "aws_vpc" "vpc-desafio-set" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  
  tags = {
    Name = "vpc-desafio-set"
  }
}

# Criação da Subnet Pública
resource "aws_subnet" "sub-desafio-set-Zona-a" {
  vpc_id                  = aws_vpc.vpc-desafio-set.id
  cidr_block              = "10.0.0.0/20"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
  tags = {
    Name = "sub-desafio-set-Zona-a"
  }
}
resource "aws_subnet" "sub-desafio-set-Zona-b" {
  vpc_id                  = aws_vpc.vpc-desafio-set.id
  cidr_block              = "10.0.16.0/20"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1b"
  tags = {
    Name = "sub-desafio-set-Zona-b"
  }
}


# Criação do Internet Gateway
resource "aws_internet_gateway" "igw-desafio-set" {
  vpc_id = aws_vpc.vpc-desafio-set.id

  tags = {
    Name = "igw-desafio-set"
  }
}


# Criação da Route Table 
resource "aws_route_table" "rt-desafio-set" {
  vpc_id = aws_vpc.vpc-desafio-set.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-desafio-set.id
  }

  tags = {
    Name = "rt-desafio-set"
  }
}


# Associando Route Table com a Subnet Pública
resource "aws_route_table_association" "zona_A_route_table_association" {
  subnet_id      = aws_subnet.sub-desafio-set-Zona-a.id
  route_table_id = aws_route_table.rt-desafio-set.id
}
resource "aws_route_table_association" "zona_B_route_table_association" {
  subnet_id      = aws_subnet.sub-desafio-set-Zona-b.id
  route_table_id = aws_route_table.rt-desafio-set.id
}
