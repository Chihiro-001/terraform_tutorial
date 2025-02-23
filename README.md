# terraform_tutorial
This repository is for a terraform tutorial.


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

### Create provider

1. Create a file called `provider.tf` 

```sh
cd ./environments/stg/main
touch provider.tf
```
1. For the content, you can use the sample file.
2. Please confirm if the profile name is the same as the AWS account you are intented to build infrastructure.
3. You can specify the terraform version. If not specified, Terraform will use the latest version.


