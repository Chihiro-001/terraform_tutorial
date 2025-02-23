module "s3_lambda" {
  source = "../../modules/apps/lambda"
  config = module.config
  s3_bucket_arn = module.s3.bucket_arn
  
}