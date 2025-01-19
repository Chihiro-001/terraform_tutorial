data "terraform_remote_state" "network" {
  backend = "local"
  config = {
    path = "../common/network/terraform.tfstate"
  }
}

# data "terraform_remote_state" "stg" {
#   backend = "local"
#   config = {
#     path = "./terraform.tfstate"
#   }
# }
