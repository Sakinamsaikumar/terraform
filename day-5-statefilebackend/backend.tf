terraform {
  backend "s3" {
    bucket = "hfskjdsaikimarsakinam"
    key    = "terraform.tfstate"
    region = "us-west-2"
    object_lock_enabled = "Enabled"
    }
  }

