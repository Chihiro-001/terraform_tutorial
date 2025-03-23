# Introduction to AWSCC

## Overview

- I have attended the JAWS-UG Tokyo in March as an audience. The theme was "IaC Night". They invited two engineers from HashiCorp as guest speakers.

- The engineers from HashiCorp have introduced AWSCC provider, which is another cloud provider available on Terraform to build AWS resources.

- They gave a mini hands-on to show AWSCC.


- I am going to break down the process taught in their presentation and provide all the necessary Terraform code and commands to migrate an existing AWSCC Security Group egress rule to be managed by a standard AWS provider block.

### Steps 

1. Understanding the Requirement
2. Importing the Existing Security Group Egress Rule
3. Generating Configuration for AWS Provider
4. Updating Terraform Files with Generated Configuration
5. Applying Changes to Import State
6. Preventing Deletion of the Original AWSCC Resource
7. Cleaning Up and Removing AWSCC Resource

## 1_Understanding the Requirement

You have an AWSCC Security Group egress rule that you want to import under a standard AWS provider block without deleting the resource during migration.

After migration, the original AWSCC resource block should be safely removed.


## 2_Importing the Existing Security Group Egress Rule

First, identify the existing AWSCC Security Group egress rule.

```hcl
resource "awscc_ec2_security_group_egress" "example" {
  group_id    = aws_security_group.allow_all.id
  ip_protocol = "tcp"
  from_port   = 80
  to_port     = 80
  cidr_ip     = "0.0.0.0/0"
  description = "Created by AWSCC Provider"
}
```

## 3_Generating Configuration for AWS Provider

Now, we will import the existing resource using the standard AWS provider.

```hcl
resource "aws_security_group_rule" "example" {
  type              = "egress"
  security_group_id = aws_security_group.allow_all.id
  protocol          = "tcp"
  from_port         = 80
  to_port           = 80
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Created by AWS Provider"

}
```

## 4_Updating Terraform Files with Generated Configuration

Now, use terraform plan to generate the configuration:

```sh
terraform plan -target=aws_security_group_rule.example -out=tfplan
```

Since we haven't specified details for the aws_security_group_rule, Terraform will identify discrepancies.

## 5_Applying Changes to Import State

Now, import the existing infrastructure to link it to the new resource.

```sh
terraform import module.main.aws_security_group_rule.example SECURITYGROUPID_egress_tcp_80_80_0.0.0.0/0
```
This command establishes a link between the existing AWS resource and the new aws_security_group_rule block.

if you see something like below, you are all good so far:

```
module.main.aws_security_group_rule.example: Importing from ID "sg-12a345678b2dc9aa1_egress_tcp_80_80_0.0.0.0/0"...
module.main.aws_security_group_rule.example: Import prepared!
  Prepared aws_security_group_rule for import
module.main.aws_security_group_rule.example: Refreshing state... [id=sg-12a345678b2dc9aa1_egress_tcp_80_80_0.0.0.0/0]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.
```
(the above security id is fake one ;p )

Verify the import:

```
terraform plan
```

You should see only the change in the description.

## 6_Preventing Deletion of the Original AWSCC Resource

To avoid deletion when you remove the AWS CC resource block, add a lifecycle block to it

```
  lifecycle {
    prevent_destroy = true
  }
```
Now apply the changes:

```sh
terraform apply
```

## 7_Cleaning Up and Removing AWSCC Resource

Finally, remove the original awscc resource block from your configuration and apply again. 

# Remove the awscc_ec2_security_group_egress_rule block

```
terraform state rm module.main.awscc_ec2_security_group_egress.example
```