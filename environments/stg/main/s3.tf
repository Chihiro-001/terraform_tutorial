module "s3" {
  source = "../../modules/apps/s3"
  config = module.config
}