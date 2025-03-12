/*resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-terraform-state-bucket-harsh"
 
  versioning {
    enabled = false
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name        = "my-terraform-state-bucket-harsh"
    Environment = "environment"
  }
}
*/
