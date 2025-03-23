locals {
  system = "tutorial"
}

output "system" {
  value = local.system
}

output "env" {
  value = var.env
}

output "stage" {
  value = "${local.system}-${var.env.name}"
}