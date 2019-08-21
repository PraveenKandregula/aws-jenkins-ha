resource "aws_s3_bucket" "jenkins-tfstate-bucket" {
  bucket = "${var.bucket_name}"

  tags {
    Name = "${var.bucket_name}"
  }

  versioning {
    enabled = true
  }
}
