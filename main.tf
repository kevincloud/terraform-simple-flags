terraform {
  required_providers {
    launchdarkly = {
      source  = "launchdarkly/launchdarkly"
      version = "2.12.0"
    }
  }
}

provider "launchdarkly" {
  access_token = var.ld_access_token
}
