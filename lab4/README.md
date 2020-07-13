# Lab 4: Entity Tags

## Requirements

* Previous labs completed
* APM Application reporting to New Relic

## Setup

1. Uncomment the lab4 section in `main.tf` as follows:

   ```
   #
   # Entity Tags
   #
   module "lab4" {
     source = "./lab4"

     guid = module.lab1.guid
   }
   ```
1. Save the file


## Edits

1. Edit `lab4.tf` with a text editor of your choice.
1. (optional) Add / change tags
1. Save the file


## Apply

1. Run `terraform init`
1. Run `terraform plan`, you should get output similar to the following:

   ```
   # module.lab4.newrelic_entity_tags.dynamic_example will be created
   + resource "newrelic_entity_tags" "dynamic_example" {
      + guid = "MjUwODI1OXxBUE18QVBQTElDQVRJT058MjA0MjYxMzY4"
      + id   = (known after apply)

      + tag {
          + key    = "environment"
          + values = [
              + "test",
            ]
        }
      + tag {
          + key    = "owner"
          + values = [
              + "Test User",
            ]
        }
      + tag {
          + key    = "service"
          + values = [
              + "test",
            ]
        }
    }
   ```

1. Run `terraform apply` to create the alert policy, ensuring there are no errors.
