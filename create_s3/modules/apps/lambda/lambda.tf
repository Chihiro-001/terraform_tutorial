# invoke the lambda function when the objects are uploaded to the s3 bucket.
locals {
  function_name = "${var.config.stage}_s3_lambda_function"
}

resource "local_file" "lambda_file" {
  content  = <<EOF
import json

def lambda_handler(event, context):
    print("The object is uploaded to S3 buckets")
    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }
EOF
  filename = "${path.module}/src/lambda_function.py"
}

data "archive_file" "function" {
  type        = "zip"
  source_dir  = "${path.module}/src"
  output_path = "/tmp/${local.function_name}.zip"
}

resource "null_resource" "lambda_zip" {
  provisioner "local-exec" {
    command     = "zip /tmp/${local.function_name}.zip lambda_function.py"
    working_dir = "${path.module}/src"
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}

resource "aws_lambda_function" "s3_lambda" {
  depends_on    = [aws_iam_role.iam_for_lambda]
  function_name = local.function_name
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.12"
  filename      = data.archive_file.function.output_path

  source_code_hash = data.archive_file.function.output_base64sha256
}

resource "aws_lambda_permission" "s3_lambda" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.s3_lambda.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = var.s3_bucket_arn
}