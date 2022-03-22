terraform {
  required_version = ">= 0.12"
  backend "s3" {
     bucket = "my-team-bucket"
     key = "nodejs/state.tfstate"
     region = "us-west-2"
  }
}

resource "aws_s3_bucket" "team-bucket" {
  bucket = "my-team-bucket"

  tags = {
    Name        = "Team bucket"
    Environment = "Dev"
  }
}


resource "aws_s3_bucket_acl" "new" {
  bucket = "${aws_s3_bucket.team-bucket.id}"
  acl = "private"
}
