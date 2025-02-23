module "s3_lambda" {
  source        = "../../../modules/apps/lambda"
  config        = module.config
  env           = var.env
  s3_bucket_arn = module.s3.s3_bucket_arn
}