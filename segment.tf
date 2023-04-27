resource "launchdarkly_segment" "my_segment" {
  key         = "example-segment-key"
  project_key = launchdarkly_project.my_project.key
  env_key     = "test"
  name        = "example segment"
  description = "This segment is managed by Terraform"
  tags        = ["managed-by-terraform"]
  included_contexts {
    values       = ["android", "ios"]
    context_kind = "mobile"
  }

  rules {
    clauses {
      attribute    = "country"
      op           = "startsWith"
      values       = ["en", "de", "un"]
      negate       = false
      context_kind = "location-data"
    }
  }
}
