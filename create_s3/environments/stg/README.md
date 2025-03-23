# Build staging

```
terraform fmt

terraform validate

terraform init

terraform plan -var-file="../stg.tfvars"

terraform apply -var-file="../stg.tfvars"

terraform destroy -var-file="../stg.tfvars"
```