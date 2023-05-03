terraform {
  required_providers {
    launchdarkly = {
      source  = "launchdarkly/launchdarkly"
      version = "2.12.0"
    }
  }
}

resource "launchdarkly_feature_flag_environment" "dev_env" {
  flag_id = var.flag_id
  env_key = var.environment_key
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
      values    = [var.segment_key]
      negate    = false
    }
    variation = 0
  }

  fallthrough {
    variation = 0
  }
  off_variation = 1
}
