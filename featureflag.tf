resource "launchdarkly_feature_flag" "terraform_flag" {
  project_key = launchdarkly_project.my_project.key
  key         = "terraform-flag"
  name        = "Terraform Flag"

  variation_type = "boolean"

  variations {
    value = "true"
  }
  variations {
    value = "false"
  }

  defaults {
    on_variation  = 0
    off_variation = 1
  }

  tags = [
    "managed-by-terraform"
  ]
}

resource "launchdarkly_feature_flag_environment" "dev_env" {
  flag_id = launchdarkly_feature_flag.terraform_flag.id
  env_key = "test"
  on      = true

  targets {
    values    = ["user0"]
    variation = 0
  }
  targets {
    values    = ["user1", "user2"]
    variation = 1
  }
  context_targets {
    values       = ["android"]
    variation    = 1
    context_kind = "mobile"
  }

  rules {
    description = "example targeting rule with two clauses"
    clauses {
      attribute = "country"
      op        = "startsWith"
      values    = ["aus", "de", "united"]
      negate    = false
    }
    clauses {
      attribute = "segmentMatch"
      op        = "segmentMatch"
      values    = [launchdarkly_segment.my_segment.key]
      negate    = false
    }
    variation = 0
  }

  fallthrough {
    variation = 0
  }
  off_variation = 1
}
