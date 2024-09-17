terraform {
  backend "s3" {
    bucket = "chowdary-hari"
    key    = "test/rds/terraform.state"
    region = "us-east-1"
  }
}
