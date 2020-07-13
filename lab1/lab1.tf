# Find an Entity data source to use later on.
# This configuration looks for an APM Application,
# however many other objects in New Relic are considered
# entities and can be referenced.
data "newrelic_entity" "app_name" {
  # Note: This must be an exact match of your app name in New Relic (Case sensitive)
  name   = "WebPortal"
  domain = "APM"
  type   = "APPLICATION"
}
