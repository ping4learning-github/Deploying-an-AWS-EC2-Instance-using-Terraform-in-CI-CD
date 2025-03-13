resource "aws_instance" "myapp_ec2" {
  ami           = "ami-05b10e08d247fb927"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  key_name      = "mytf-key"
  vpc_security_group_ids = ["sg-054cd64a2f0d9d992"]

  associate_public_ip_address = true

  root_block_device {
    volume_size           = 20
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
  }

  # User Data to Install Apache and Download Files from S3
  user_data = <<-EOF
      #!/bin/bash
    yes | sudo yum update -y
    yes | sudo yum install httpd -y
    echo "<h1>Server Details</h1><p><strong>Hostname:</strong> $(hostname)</p> \
    <p><strong>IP Address:</strong> $(hostname -I | awk '{print $1}')</p>" | sudo tee /var/www/html/index.html > /dev/null
    sudo systemctl restart httpd
    sudo systemctl enable httpd  # Ensure Apache starts on reboot
  EOF

  tags = {
    Name = "MyPublicEC2"
  }
}
