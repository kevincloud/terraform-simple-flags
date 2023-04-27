resource "launchdarkly_feature_flag" "team_flag" {
  project_key = launchdarkly_project.my_project.key
  key         = "team-data-flag"
  name        = "Team Data Flag"

  variation_type = "json"
  variations {
    value = data.local_file.team_data_1.content
    name  = "Team 1"
  }
  variations {
    value = data.local_file.team_data_2.content
    name  = "Team 2"
  }
  variations {
    value = data.local_file.team_data_3.content
    name  = "Team 3"
  }
  defaults {
    on_variation  = 2
    off_variation = 0
  }

  client_side_availability {
    using_environment_id = true
  }

  tags = [
    "demo",
    "managed-by-terraform"
  ]
}
