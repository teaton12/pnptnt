resource "aws_vpc" "new_vpc_environment" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_subnet" "subnet1" {
  cidr_block        = "${cidrsubnet(aws_vpc.new_vpc_environment.cidr_block, 1, 1)}"
  vpc_id            = "${aws_vpc.new_vpc_environment.id}"
  availability_zone = "${var.availability_zones["zone1"]}"
}