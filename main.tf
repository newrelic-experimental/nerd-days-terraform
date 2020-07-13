terraform {
  required_providers {
    newrelic = "> 2.1"
  }
}

# Configure the New Relic provider
provider "newrelic" {
  #account_id    = <Your Account ID>       # Numeric account ID, Or set NEW_RELIC_ACCOUNT_ID
  #api_key       = <Your Personal API Key> # usually prefixed with 'NRAK', Or set NEW_RELIC_API_KEY
  #admin_api_key = <Your Admin API Key>    # usually prefixed with 'NRAA', Or set NEW_RELIC_ADMIN_API_KEY
  #region        = "US"                    # Valid regions are US and EU, Or set NEW_RELIC_REGION
}


#
# Entities
#
#module "lab1" {
#  source = "./lab1"
#}


#
# Alert Policies
#
#module "lab2" {
#  source = "./lab2"
#}


#
# Alert Conditions
#
#module "lab3" {
#  source = "./lab3"
#
#  # Here we are using output vars from the labs above to feed into the alert condtion
#  application_id = module.lab1.application_id
#  policy_id      = module.lab2.policy_id
#}


#
# Entity Tags
#module "lab4" {
#  source = "./lab4"
#
#  guid = module.lab1.guid
#}


#
# Dashboards
#
#module "lab5" {
#  source = "./lab5"
#
#  application_id = module.lab1.application_id
#}

