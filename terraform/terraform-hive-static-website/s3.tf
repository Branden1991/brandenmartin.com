resource "aws_s3_bucket" "static-website" {
  bucket = var.website_fqdn

  tags = {
    Name = "${var.project_name}-${var.env}-${var.website_fqdn}-static-website"
  }
}

resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.static-website.id
  acl    = "private"
}