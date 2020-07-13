#
# Alert Condition
#
# The following is an example APM Application Alert Condtion.
#
resource "newrelic_alert_condition" "alert_condition_name" {
  # These variables are passed into the module
  policy_id = var.policy_id

  # A condition can target multiple entities.  Here we pass in a single
  # application ID (as an array) to target our test application
  entities  = [
    var.application_id,
  ]

  name            = "My Alert Condition Name"
  type            = "apm_app_metric"
  metric          = "apdex"
  runbook_url     = "https://www.example.com"
  condition_scope = "application"

  term {
    duration      = 5
    operator      = "below"
    priority      = "critical"
    threshold     = "0.75"
    time_function = "all"
  }
}


#
# NRQL Alert condition
#
resource "newrelic_nrql_alert_condition" "foo" {
  policy_id            = var.policy_id
  type                 = "static"
  name                 = "foo"
  description          = "Alert when transactions are taking too long"
  runbook_url          = "https://www.example.com"
  enabled              = true
  value_function       = "single_value"
  violation_time_limit = "one_hour"

  nrql {
    #
    # This is a long way to write this statement, but it is best practice
    # to split up long NRQL queries in to a more readable multi-line format
    # and since we're generating it dynamically, we already need the join()
    #
    query = join(" ", [
      "FROM Transaction",
        "SELECT average(duration)",
        "WHERE appId =", var.application_id,
    ])
    evaluation_offset = 3
  }

  critical {
    operator              = "above"
    threshold             = 5.5
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }

  warning {
    operator              = "above"
    threshold             = 3.5
    threshold_duration    = 600
    threshold_occurrences = "ALL"
  }
}

