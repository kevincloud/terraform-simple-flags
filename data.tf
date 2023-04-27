data "local_file" "team_data_1" {
  filename = "${path.module}/files/team1.json"
}

data "local_file" "team_data_2" {
  filename = "${path.module}/files/team2.json"
}

data "local_file" "team_data_3" {
  filename = "${path.module}/files/team3.json"
}
