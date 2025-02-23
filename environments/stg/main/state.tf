data "terraform_remote_state" "stg" {
  backend = "local"
  config = {
    path = "./terraform.tfstate"
  }
}
