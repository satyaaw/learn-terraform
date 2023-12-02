resource "aws_instance" "sample"{
     ami           = "ami-03265a0778a880afb"
     instance_type = "t2.micro"

     tags = {
        Name = "frontend"
     }
}