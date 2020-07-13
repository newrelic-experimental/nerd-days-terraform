# Create a test Alert policy
resource "newrelic_alert_policy" "alert_policy_name" {
  name = "TEST: Lab2 Alert Policy"

  # (Optional) The rollup strategy for the policy. Options
  # include: PER_POLICY, PER_CONDITION, or PER_CONDITION_AND_TARGET.
  # The default is PER_POLICY.
  incident_preference = "PER_POLICY"
}
