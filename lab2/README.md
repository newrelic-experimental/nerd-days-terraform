# Lab 2: Alert Policies

## Requirements

* Previous labs completed
* APM Application reporting to New Relic

## Setup
1. Uncomment the lab2 section in `main.tf` as follows:

   ```
   #
   # Alert Policies
   #
   module "lab2" {
     source = "./lab2"
   }
   ```

1. Save the file

## Edits

1. Edit `lab2.tf` with a text editor of your choice. We'll start with the first section that is already uncommented.
1. (optional) Change the `name` value to any new policy name for testing.
1. Save the file

## Apply

1. Run `terraform init`
1. Run `terraform plan`, you should get output similar to the following:

   ```
   $ terraform plan

   Terraform will perform the following actions:

     # newrelic_alert_policy.alert_policy_name will be created
     + resource "newrelic_alert_policy" "alert_policy_name" {
         + account_id          = <Your Account ID>
         + id                  = (known after apply)
         + incident_preference = "PER_POLICY"
         + name                = "TEST: Lab2 Alert Policy"
       }

   Plan: 1 to add, 0 to change, 0 to destroy.
   ```

1. Run `terraform apply` to create the alert policy, ensuring there are no errors.
