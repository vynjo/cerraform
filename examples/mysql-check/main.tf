module "circonus" {
  source = "modules/circonus"

  account_name = "${var.circonus_account_name}"
  /*alert_slack_channel_name = "${var.slack-channel}"
  alert_slack_escalate_channel_name = "${var.slack-escalate-channel}"
  alert_slack_team_id = "${var.slack-team-id}"*/
  api_token  = "${var.circonus_api_token}"

  collectors_enterprise = ["${data.circonus_collector.noit01.id}"]
  collectors_public = ["${data.circonus_collector.ashburn.id}", "${data.circonus_collector.chicago.id}"]
  check_name = "Circonus SaaS Check"
  environment = "dev"
  dsn = "user=${var.dbuser} host=${var.dbhost} port=${var.dbport} host=${var.dbhost} password=${var.dbpassword}"
  dbhost = "${var.dbhost}"
}

/*module "mysql-check" {


  collectors = ["${data.circonus_collector.home_broker.id}"]
  check_name = "Test MSQL Check"
  check_notes = "Check to observe various queue times in PostgreSQL"
  dsn = "user=${var.dbuser} host=${var.dbhost} port=${var.dbport} host=${var.dbhost}"
  password = "${var.dbpassword}"
  mysqlhost = "${var.dbhost}"
}*/
