provider "aws" {
  region = "us-east-1"
 }

 resource "aws_security_group" "myGroup1" {
   name = "group1"
   description = "security group"
     
   ingress  {
     description = "inbound ssh"
     cidr_blocks = [ "0.0.0.0/0" ]
     protocol = "tcp"
     from_port = 22
     to_port = 22
   }

   egress  {
     description = "outbound"
     cidr_blocks = [ "0.0.0.0/0" ]
     protocol = "-1"
     from_port = 0
     to_port = 0
   }  
 }
 
 resource "aws_instance" "node" {
   ami = "ami-00ddb0e5626798373"
   instance_type = "t3.micro"
   vpc_security_group_ids  = [aws_security_group.myGroup1.id]
   key_name = "ssh-key"
   count = 4
 }
 
resource "aws_key_pair" "ssh-key" {
  key_name = "ssh-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDdcs5/2CNvoJIKTGQZ2EoAh/EhHBdw10O7EgG2G+gLm4jRL8GPz95fQ1KQy2jDfDzHfsFG6+sNlfQOAefj/HVntWhUZywMkFZiyieSTAX8mJkZnfA2XAkdBGCa3w9MknRd0h/bbfHtHB7aUd5awQvtROeVAt6TJ9A+36XSrC50XKAKST/WK/3jbzZz7YsU3inIzngSw6g1at3g/kPE988A38IbiEuxIOo7GW9SoS9vhLUeZWyrS36lvnlHo33rkvkCvuh/stiCuSaJx6E1Xvuzb3SIb3O0IhLhwJt6bAILZh0rvwSgboBuvvK7N1cl3o5qgJnYzpCKUlpP0jm85EWH"
}
