terraform {
    backend "s3" {
    key    = "day-1/terraform.tfstate"
    region = "us-west-2"
    use_lockfile = true
    #dynamodb_table = "saikumarsakinam"
    #encrypt = true
    }
  }
