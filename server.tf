resource "aws_instance" "test_server" {
  ami           = "ami-07e075f00c26b085a"
  instance_type = "t3.micro"
  key_name      = "key123"
  vpc_security_group_ids = ["sg-0c64674a9902a10b3"]

  root_block_device {
    volume_size = 8   # storage in GB
    volume_type = "gp3"
  }

  tags = {
    Name = "TestServer"
  }
}

resource "aws_instance" "Prod_server" {
  ami           = "ami-07e075f00c26b085a"
  instance_type = "t3.micro"
  key_name      = "key123"
  vpc_security_group_ids = ["sg-0c64674a9902a10b3"]                                                                                                                                                                                                                                                                       root_block_device {                                                                                                                                           volume_size = 8   # storage in GB
    volume_type = "gp3"
  }                                                                                                                                                                                                                                                                                                                       tags = {
    Name = "Prod_server"
  }                                                                                                                                                         }
