terraform {
  backend "s3" {
    bucket = "chowdary-hari"
    key    = "test/sg/terraform.state"
    region = "us-east-1"
  }
}