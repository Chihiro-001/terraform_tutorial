# terraform_tutorial (ENG)
This repository is for a terraform tutorial.
japanese instruction is below

## Steps
### Prep
1. Create directories
   1. environments
      1. stg: used for staging
      2. prod: used for production
      3. common: used for both staging and prod. Typically for Network.
   2. modules
      1. apps: used to store modules for apps
      2. config: used to store modules for configuration such as default tag names, default AWS regions, etc
2. Create .gitignore
   1. In case you want to manage the state file locally, make sure to create the .gitignore before `git commit`. Otherwise, your remote git repo won't accept your push due to large file size. The state file is over the capacity of remote repos. 
   2. Alternatively you can install `git lfs` and manage the state file and remove the file from your commits.
   3. Or, manage your state file remotely, such as using S3 bucket.

---

### Create provider

Terraform supports multi cloud provider. you need to first specify which cloud provider you want Terraform to build the infrastructure.

1. Create a file called `provider.tf` 

```sh
cd ./environments/stg/main
touch provider.tf
```
1. For the content, you can use the sample file.
2. Please confirm if the profile name is the same as the AWS account you are intented to build infrastructure.
3. You can specify the terraform version. If not specified, Terraform will use the latest version.

---

### Create the Configuration Module

Since we have a few members doing hands on at the same time, we need to create unique names for resources we are applying to AWS assount.


1. Create the configuration module directory:

```
mkdir -p modules/config
```

2. Create the this.tf file in the config directory:
```
touch modules/config/this.tf
```

1. Add the content to this.tf
   1. Please refer to this.tf!
2. Create the variables.tf file in the config directory:
   1. Please refer to variables.tf!
3. Create the stg.tfvars file in the stg directory:
```
touch environments/stg/stg.tfvars
```
4. Add the following content to stg.tfvars:
   1. Please refer to stg.tfvars

We will use the stg.tfvars as input values.

5. Create the config.tf in the environments/stg/main
```
module "config" {
  source = "../../../modules/config"
  env    = var.env
}
```
6. Create the variables.tf in the environments/stg/main
```
variable "env" {

}
```

---

### Create the S3 Bucket Module

Now, Terraform knows where to terraform AWS resources!

The module helps you to re-use the resource. 

many tutorials for begineers use main.tf and dump all the resouces, outputs and variables in to that. 

I personally do not recommend this way. I recommend creating tf files for each resource (eg. EC2 instance should be in ec2.tf. ) and if possible categorize the directories; such as database, apps, logs etc. 

This hands-on is quite small, but for you to feel the sense of practical directory structure, I am still going to create tf files per resource.

1. Create the S3 module directory:
```
mkdir -p modules/apps/s3
```

2. Create the s3.tf file in the s3 directory:
```
touch modules/apps/s3/s3.tf
```

3. Add the following content to s3.tf:

```
resource "aws_s3_bucket" "this" {
  bucket = "${var.config.stage}-bucket"
}
```

4. Create variables.tf in the s3 directory:
```
variable "config" {
  description = "Configuration for the module"
}

variable "env" {
  
}
```
By refering to these, we can add prefix. (We need `config` and `env` as you can see in the config modules)

### Create s3.tf in the main directory

Create the s3.tf in the environments/stg/main
```
module "s3" {
  source = "../../../modules/apps/s3"
  config = module.config
  env    = var.env
}
```

---
## Create S3 to the AWS Console

```
cd environments/stg/main

terraform fmt

terraform validate

terraform init

terraform plan -var-file="../stg.tfvars"

terraform apply -var-file="../stg.tfvars"

```

---

## Create Lambda function




