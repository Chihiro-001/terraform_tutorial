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
6. Preventing Deletion of the Original AWS CC Resource
7. Cleaning Up and Removing AWS CC Resource

## Understanding the Requirement

You have an AWS CC Security Group egress rule that you want to import under a standard AWS provider block without deleting the resource during migration. After migration, the original AWS CC resource block should be safely removed.


## Importing the Existing Security Group Egress Rule



## Generating Configuration for AWS Provider

## Updating Terraform Files with Generated Configuration

## Applying Changes to Import State

## Preventing Deletion of the Original AWS CC Resource

## Cleaning Up and Removing AWS CC Resource