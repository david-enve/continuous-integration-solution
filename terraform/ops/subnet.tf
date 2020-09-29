# subnet for az a
resource "aws_subnet" "devops-lab-dev-sn-a" {
  vpc_id     = "${aws_vpc.devops-lab-dev-vpc.id}"
  cidr_block = "${var.devops-lab-dev-sn-a-cidr}"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"

  tags   = {
    type = "devops-lab-dev-sn-a"
    env  = "dev"
    Name = "devops-lab-dev-sn-a"
  }
}

resource "aws_route_table" "devops-lab-dev-rt-public-a" {
  vpc_id = "${aws_vpc.devops-lab-dev-vpc.id}"

  tags   = {
    type = "devops-lab-dev-rt-public-a"
    env  = "dev"
    Name = "devops-lab-dev-rt-public-a"
  }
}

resource "aws_route" "devops-lab-dev-int-route-a" {
  route_table_id         = "${aws_route_table.devops-lab-dev-rt-public-a.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.devops-lab-dev-igw.id}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route_table_association" "devops-lab-dev-rt-assoc-a" {
  subnet_id      = "${aws_subnet.devops-lab-dev-sn-a.id}"
  route_table_id = "${aws_route_table.devops-lab-dev-rt-public-a.id}"

  lifecycle {
    ignore_changes        = ["subnet_id", "route_table_id"]
    create_before_destroy = true
  }
}

# subnet for az b
resource "aws_subnet" "devops-lab-dev-sn-b" {
  vpc_id     = "${aws_vpc.devops-lab-dev-vpc.id}"
  cidr_block = "${var.devops-lab-dev-sn-b-cidr}"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1b"

  tags   = {
    type = "devops-lab-dev-sn-b"
    env  = "dev"
    Name = "devops-lab-dev-sn-b"
  }
}

resource "aws_route_table" "devops-lab-dev-rt-public-b" {
  vpc_id = "${aws_vpc.devops-lab-dev-vpc.id}"

  tags   = {
    type = "devops-lab-dev-rt-public-b"
    env  = "dev"
    Name = "devops-lab-dev-rt-public-b"
  }
}

resource "aws_route" "devops-lab-dev-int-route-b" {
  route_table_id         = "${aws_route_table.devops-lab-dev-rt-public-b.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.devops-lab-dev-igw.id}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route_table_association" "devops-lab-dev-rt-assoc-b" {
  subnet_id      = "${aws_subnet.devops-lab-dev-sn-b.id}"
  route_table_id = "${aws_route_table.devops-lab-dev-rt-public-b.id}"

  lifecycle {
    ignore_changes        = ["subnet_id", "route_table_id"]
    create_before_destroy = true
  }
}

