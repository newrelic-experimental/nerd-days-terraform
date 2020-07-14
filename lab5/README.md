# Lab 5: Dashboards

## Requirements

* Previous labs completed
* APM Application reporting to New Relic
* **Admin API Key** set in Terraform

## Setup

1. Uncomment the lab5 section in `main.tf` as follows:

   ```
   #
   # Dashboards
   #
   module "lab5" {
     source = "./lab5"

     application_id = module.lab1.application_id
   }
   ```

1. Save the file


## Edits

1. Edit `lab5.tf` with a text editor of your choice.
1. (optional) Change the name of the dashboard, or explore some of the NRQL
   queries.
1. Save the file


## Apply

1. Run `terraform init`
1. Run `terraform plan`, you should get output similar to the following:

   ```
   ```

1. Run `terraform apply` to create the alert policy, ensuring there are no errors.
