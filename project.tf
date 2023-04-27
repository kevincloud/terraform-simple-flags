resource "launchdarkly_project" "my_project" {
  key  = "kevinc-project"
  name = "KevinC Sample Project"

  environments {
    key   = "test"
    name  = "Test"
    color = "EEEEEE"
  }

  environments {
    key   = "prod"
    name  = "Production"
    color = "555555"
  }
}
