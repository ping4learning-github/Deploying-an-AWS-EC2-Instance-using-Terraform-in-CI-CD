# Inbound rule: Allow SSH (22) from anywhere
resource "aws_security_group_rule" "allow_ssh" {
  security_group_id = "sg-054cd64a2f0d9d992"
  type              = "ingress"
  from_port        = 22
  to_port          = 22
  protocol         = "tcp"
  cidr_blocks      = ["0.0.0.0/0"]  # Open to all, restrict to your IP if needed
}

# Inbound rule: Allow HTTP (80) from anywhere
resource "aws_security_group_rule" "allow_http" {
  security_group_id = "sg-054cd64a2f0d9d992"
  type              = "ingress"
  from_port        = 80
  to_port          = 80
  protocol         = "tcp"
  cidr_blocks      = ["0.0.0.0/0"]
}

# Inbound rule: Allow HTTPS (443) from anywhere
resource "aws_security_group_rule" "allow_https" {
  security_group_id = "sg-054cd64a2f0d9d992"
  type              = "ingress"
  from_port        = 443
  to_port          = 443
  protocol         = "tcp"
  cidr_blocks      = ["0.0.0.0/0"]
}

#Terraform Code to Add Inbound & Outbound Rules
# Outbound rule: Allow all traffic (default in AWS)
resource "aws_security_group_rule" "allow_all_outbound" {
  security_group_id = "sg-054cd64a2f0d9d992"  #SG for configure the inbound and outbound rules.
  type              = "egress"
  from_port        = 0
  to_port          = 0
  protocol         = "-1"  # Allow all protocols
  cidr_blocks      = ["0.0.0.0/0"]
}

# Inbound rule: Allow all traffic (default in AWS)
resource "aws_security_group_rule" "allow_all_inbound" {
  security_group_id = "sg-054cd64a2f0d9d992"  #SG for configure the inbound and outbound rules.
  type              = "ingress"
  from_port        = 0
  to_port          = 0
  protocol         = "-1"  # Allow all protocols
  cidr_blocks      = ["0.0.0.0/0"]
}
*/
