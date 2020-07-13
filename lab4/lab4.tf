#
# Tags are custom metadata that can be applied to your Entities.
# They make an easy way to filter and group entities together
# by environment, team, language, etc.
#

#
# This is an example of a dynamic set of tags, where
# the data is being passed in to this lab module
#
resource "newrelic_entity_tags" "dynamic_example" {
  guid = var.guid

  dynamic "tag" {
    for_each = merge(var.tags, local.common_tags)
    content {
      key    = tag.key
      values = list(tag.value)
    }
  }
}


#
# Local set of vars
#
locals {
  # Common tags to be assigned to all resources
  common_tags = {
    service     = "test"
    owner       = "Test User"
    environment = "test"
  }
}

#
# Tags can also be created statically
#
#resource "newrelic_entity_tags" "manual_example" {
#    guid = var.guid
#
#    tag {
#        key = "teams"
#        values = ["dev", "ops"]
#    }
#
#    tag {
#        key = "environment"
#        values = ["test"]
#    }
#}


