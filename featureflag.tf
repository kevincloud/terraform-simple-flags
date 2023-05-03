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

module "default_targets" {
  source          = "./modules/default_targets"
  flag_id         = launchdarkly_feature_flag.terraform_flag.id
  environment_key = "test"
  segment_key     = launchdarkly_segment.my_segment.key
}
