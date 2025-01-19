resource "aws_s3_bucket" "website" {
  bucket = "my-tf-test-bucket"
  tags = {
    Name        = "tutorial"
  }
}

resource "aws_s3_bucket_ownership_controls" "website" {
  bucket = aws_s3_bucket.website.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "website" {
  depends_on = [aws_s3_bucket_ownership_controls.website]

  bucket = aws_s3_bucket.website.id
  acl    = "private"
}

resource "aws_s3_bucket_policy" "website" {
  bucket = aws_s3_bucket.website.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = ["s3:GetObject", "s3:ListBucket", "s3:PutObject"]
        Resource  = "${aws_s3_bucket.website.arn}/*"
      },
    ]
  })
}

# Presigned URL example
resource "null_resource" "presigned_url" {
  provisioner "local-exec" {
    command = <<EOT
      aws s3 presign s3://${aws_s3_bucket.website.bucket}/index.html
    EOT
  }
}