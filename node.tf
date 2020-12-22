provider "aws" {
  region = "us-east-1"
 }

 resource "aws_security_group" "myGroup1" {
   name = "group1"
   description = "security group"
     
   ingress  {
     description = "inbound"
     cidr_blocks = [ "0.0.0.0/0" ]
     protocol = "-1"
     from_port = 0
     to_port = 0
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
   count = 2
 }
 
resource "aws_key_pair" "ssh-key" {
  key_name = "ssh-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCd1asempe53PptCHEZJ1Hp+biFNF4PHNkW2N7wIlCMJXAsLRQo6TsuMGe+W6B2t+dtMrj4czq5OBEUb/aS4rwVa/EtWeoBC7749xiZIyt0wUsLFEardw07hoazj96mFRZmpkJ3rd8CKU+grXMiSNwBQcVKR1rg3MVt/RwQdzC8t/ufNKqKwzkNvW/lSkl6WZjQU/ZdI9TKsapK5Xqjv9IBBXnfo5b7SVt56F+LOPNNSBKrJyR+LRyiADESfOITsqldeveeUIGC40Vwh48ZBeBzBbAwCX7wj5T80ThoNGTNdtWH/uQA1XI2TPs2e7GVv4Krn0aLfk4h3r+ol6+KN8aX"
}
