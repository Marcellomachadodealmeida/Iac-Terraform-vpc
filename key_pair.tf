
resource "aws_key_pair" "key-pair-vpc-teste" {
  key_name = "key-pair-vpc-teste"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "local_file" "tf-key" {
  content = tls_private_key.rsa.private_key_pem
  filename = "key-pair-vpc-teste.pem"
}
