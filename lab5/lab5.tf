resource "newrelic_dashboard" "lab5_dash" {
  title = "Lab 5: New Relic Terraform Example"

  # Either 3 or 12. For New Relic One Dashboards, use 12
  grid_column_count = 12

  visibility = "all"
  editable   = "read_only" 

  filter {
    event_types = [
        "Transaction"
    ]
    attributes = [
        "appName",
        "name"
    ]
  }

  widget {
    title = "Requests per minute"
    visualization = "billboard"
    nrql = "FROM Transaction SELECT rate(count(*), 1 minute)"
    row = 1
    column = 1
    height = 3
    width = 2
  }

  widget {
    title = "Error rate"
    visualization = "gauge"
    nrql = "FROM Transaction SELECT percentage(count(*), WHERE error IS True)"
    threshold_red = 2.5
    row = 1
    column = 3
    height = 3
    width = 2
  }

  widget {
    title = "Requests per minute, by transaction"
    visualization = "facet_table"
    nrql = "FROM Transaction SELECT rate(count(*), 1 minute) FACET name"
    row = 1
    column = 5
    height = 5
    width = 4
  }


  widget {
    title = "Average transaction duration, by application"
    visualization = "facet_bar_chart"
    nrql = "FROM Transaction SELECT average(duration) FACET appName"
    row = 1
    column = 9
    height = 4
    width = 4
  }

  widget {
    title = "Apdex, top 5 by host"
    duration = 1800000
    visualization = "metric_line_chart"
    entity_ids = [
      var.application_id,
    ]
    metric {
        name = "Apdex"
        values = [ "score" ]
    }
    facet = "host"
    limit = 5
    row = 4
    column = 1
    height = 2
    width = 4
  }

  widget {
    title = "Dashboard Note"
    visualization = "markdown"
    source = "### Helpful Links\n\n* [New Relic One](https://one.newrelic.com)\n* [Developer Portal](https://developer.newrelic.com)"
    row = 5
    column = 9
    height = 2
    width = 4
  }
}

