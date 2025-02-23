module "s3" {
  source = "../../../modules/apps/s3"
  config = module.config
  env    = var.env
  # lambda_function_arn = module.s3_lambda.arn
  # lambda_permission_arn = module.s3_lambda.lambda_permission_arn
}