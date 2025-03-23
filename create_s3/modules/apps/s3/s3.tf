# create a private bucket
resource "aws_s3_bucket" "this" {
  bucket = "${var.config.stage}-bucket"
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.this.id

  lambda_function {
    lambda_function_arn = var.lambda_function_arn
    events              = ["s3:ObjectCreated:*"]
  }

  depends_on = [var.lambda_permission_id]
}
