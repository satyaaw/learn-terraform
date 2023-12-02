resource "aws_instance" "frontend"{
     ami           = "ami-03265a0778a880afb"
     instance_type = "t2.micro"
     vpc_security_group_ids=["sg-0da218009af18c721"]

     tags = {
        Name = "frontend"
     }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z047443812PAJBPLM57X"
  name    = "frontend-dev"
  type    = "A"
  ttl     = 300
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "backend"{
     ami           = "ami-03265a0778a880afb"
     instance_type = "t2.micro"
     vpc_security_group_ids=["sg-0da218009af18c721"]

     tags = {
        Name = "backend"
     }
}

resource "aws_route53_record" "backend" {
  zone_id = "Z047443812PAJBPLM57X"
  name    = "backend-dev"
  type    = "A"
  ttl     = 300
  records = [aws_instance.backend.private_ip]
}

resource "aws_instance" "mysql"{
     ami           = "ami-03265a0778a880afb"
     instance_type = "t2.micro"
     vpc_security_group_ids=["sg-0da218009af18c721"]

     tags = {
        Name = "mysql"
     }
}

resource "aws_route53_record" "mysql" {
  zone_id = "Z047443812PAJBPLM57X"
  name    = "mysql-dev"
  type    = "A"
  ttl     = 300
  records = [aws_instance.backend.private_ip]
}