resource "aws_s3_bucket" "logs-jtlee" {
  bucket = "logs-jt"
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name = "TerraformStateLock"
  read_capacity = 5
  write_capacity = 5
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_s3_bucket" "terraform-state" {
  bucket = "terraform-state-jt"
  versioning {
    enabled = true
  }

  logging {
    target_bucket = "${aws_s3_bucket.logs-jtlee.id}"
    target_prefix = "log/"
  }
  lifecycle {
    prevent_destroy = true
  }
}