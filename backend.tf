terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-harsh"
    key            = "terraform.tfstate"  # Path to the state file in the bucket
    region         = "us-east-1"
    encrypt        = true
      
  }
}
