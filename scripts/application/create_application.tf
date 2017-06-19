provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_elastic_beanstalk_application" "beanstalk_application" {
  name = "${var.app_name}"
  description = "${var.app_description}"
}