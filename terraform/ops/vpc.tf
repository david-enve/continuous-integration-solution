# vpc for devops laboratory
resource "aws_vpc" "devops-lab-dev-vpc" {
  cidr_block           = "${var.devops-lab-dev-vpc-cidr}"
  enable_dns_hostnames = "true"

  tags   = {
    type = "devops-lab-dev-vpc"
    env  = "dev"
    Name = "devops-lab-dev-vpc"
  }
}

resource "aws_internet_gateway" "devops-lab-dev-igw" {
  vpc_id = "${aws_vpc.devops-lab-dev-vpc.id}"

  tags   = {
    type = "devops-lab-dev-igw"
    env  = "dev"
    Name = "devops-lab-dev-igw"
  }
}
