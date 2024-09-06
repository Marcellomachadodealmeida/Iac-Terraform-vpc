
resource "aws_instance" "Ec2-desafio-set" {
  ami = "ami-06c68f701d8090592"
  instance_type = "t2.micro"
  key_name = "key-pair-vpc-teste"
  availability_zone = "us-east-1b"
  associate_public_ip_address = true
  tags = {
    Ambiente = "Dev"
    Name = "Bia-dev-desafio-set"
  }
  vpc_security_group_ids = [aws_security_group.Sg-desafio-vpc.id]
  subnet_id = local.subnet_zona_b
  root_block_device {
    volume_size = 10
  }

}
