#
# This file defines vars for this lab
#

output "guid" {
  value = data.newrelic_entity.app_name.guid
}

output "application_id" {
  value = data.newrelic_entity.app_name.application_id
}

