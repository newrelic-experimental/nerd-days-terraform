# Lab 3: Alert Conditions

## Requirements

* Previous labs completed
* APM Application reporting to New Relic
* **Admin API Key** for `newrelic_alert_condtion`

## Setup

1. Uncomment the lab3 section in `main.tf` as follows:

   ```
   #
   # Alert Conditions
   #
   module "lab3" {
     source = "./lab3"

     # Here we are using output vars from the labs above to feed into the alert condtion
     application_id = module.lab1.application_id
     policy_id      = module.lab2.policy_id
   }
   ```

1. Save the file


## Edits

1. Edit `lab3.tf` with a text editor of your choice. We'll start with the first section that is already uncommented.
1. Save the file


## Apply

1. Run `terraform init`
1. Run `terraform plan`, you should get output similar to the following:

   ```
   # module.lab3.newrelic_alert_condition.alert_condition_name will be created
   + resource "newrelic_alert_condition" "alert_condition_name" {
       + condition_scope = "application"
       + enabled         = true
       + entities        = [
           + 204261368,
         ]
       + id              = (known after apply)
       + metric          = "apdex"
       + name            = "My Alert Condition Name"
       + policy_id       = (known after apply)
       + runbook_url     = "https://www.example.com"
       + type            = "apm_app_metric"

       + term {
           + duration      = 5
           + operator      = "below"
           + priority      = "critical"
           + threshold     = 0.75
           + time_function = "all"
         }
     }

   # module.lab3.newrelic_nrql_alert_condition.foo will be created
   + resource "newrelic_nrql_alert_condition" "foo" {
       + account_id           = 2508259
       + description          = "Alert when transactions are taking too long"
       + enabled              = true
       + id                   = (known after apply)
       + name                 = "foo"
       + policy_id            = (known after apply)
       + runbook_url          = "https://www.example.com"
       + type                 = "static"
       + value_function       = "single_value"
       + violation_time_limit = "one_hour"

       + critical {
           + operator              = "above"
           + threshold             = 5.5
           + threshold_duration    = 300
           + threshold_occurrences = "ALL"
         }

       + nrql {
           + evaluation_offset = 3
           + query             = "FROM Transaction SELECT average(duration) WHERE appId = 204261368"
         }

       + warning {
           + operator              = "above"
           + threshold             = 3.5
           + threshold_duration    = 600
           + threshold_occurrences = "ALL"
         }
     }
   ```

1. Run `terraform apply` to create the alert policy, ensuring there are no errors.
