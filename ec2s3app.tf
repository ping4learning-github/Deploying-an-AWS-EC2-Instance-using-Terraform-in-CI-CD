resource "aws_instance" "myy_ec2" {
  ami           = "ami-05b10e08d247fb927"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  key_name      = "mytf-key"
  vpc_security_group_ids = ["sg-054cd64a2f0d9d992"]

  associate_public_ip_address = true

  root_block_device {
    volume_size           = 10
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
  }

  # User Data to Install Apache and Download Files from S3
  user_data = <<-EOF
    #!/bin/bash
    yes | sudo yum update -y
    yes | sudo yum install httpd -y

    sudo systemctl start httpd
    sudo systemctl enable httpd

    # Download files from S3
    aws s3 cp s3://harshh123/index.html /var/www/html/index.html
    aws s3 cp s3://harshh123/style.css /var/www/html/style.css
    

    sudo systemctl restart httpd
  EOF

  tags = {
    Name = "Myapplication"
  }
}
