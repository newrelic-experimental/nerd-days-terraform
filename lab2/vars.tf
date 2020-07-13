#
# This file defines vars for this lab
#

output "policy_id" {
  value = newrelic_alert_policy.alert_policy_name.id
}

