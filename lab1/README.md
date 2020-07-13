# Lab 1: Entities

## Requirements

* APM Application reporting to New Relic

## Setup

1. Uncomment the lab2 section in `main.tf` as follows:

   ```
   #
   # Entities
   #
   module "lab1" {
     source = "./lab1"
   }
   ```

1. Save the file

## Edits

1. Edit `lab1.tf` with a text editor of your choice.
1. Change the `name` value to match an application reporting to your account. **Note:** This must be an exact match of your app name in New Relic (Case sensitive):

   ```
   # Data Source
   data "newrelic_entity" "app_name" {
     name   = "WebPortal"   # CHANGE THIS LINE
   }
   ```

1. Save the file


## Apply

1. Run `terraform init`
1. Run `terraform plan`, you should get output similar to the following:

   ```
   $ terraform plan
   Refreshing Terraform state in-memory prior to plan...
   The refreshed state will be used to calculate this plan, but will not be
   persisted to local or remote state storage.

   module.lab1.data.newrelic_entity.app_name: Refreshing state...

   ------------------------------------------------------------------------

   No changes. Infrastructure is up-to-date.
   ```

