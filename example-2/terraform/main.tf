resource "aws_s3_bucket" "bucket" {
  bucket = "codebuild-locally-akbun"

  tags = {
    Name        = "Codebuild locally demo"
    Environment = "local"
  }
}
