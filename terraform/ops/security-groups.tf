# security groups for devops ops lab
resource "aws_security_group" "devops-lab-dev-sg" {
  name = "devops-lab-dev-sg"
  description = "devops lab dev security group"
  vpc_id      = "${aws_vpc.devops-lab-dev-vpc.id}"

  ingress {
    from_port       = "${var.ssh-port}"
    to_port         = "${var.ssh-port}"
    protocol        = "tcp"
    cidr_blocks     = ["${var.devops-lab-dev-vpc-cidr}","${var.public_ip1}","${var.public_ip2}"]
  }

  ingress {
    from_port       = "${var.http-port}"
    to_port         = "${var.http-port}"
    protocol        = "tcp"
    cidr_blocks     = ["${var.devops-lab-dev-vpc-cidr}","${var.public_ip1}","${var.public_ip2}"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

 tags = {
    Name = "devops-lab-dev-sg"
 }
}

# security groups for elasticsearch
resource "aws_security_group" "devops-lab-elasticsearch-sg" {
  name = "devops-lab-elasticsearch-sg"
  description = "devops lab elasticsearch security group"
  vpc_id      = "${aws_vpc.devops-lab-dev-vpc.id}"

  ingress {
    from_port       = "${var.ssh-port}"
    to_port         = "${var.ssh-port}"
    protocol        = "tcp"
    cidr_blocks     = ["${var.devops-lab-dev-vpc-cidr}","${var.public_ip1}","${var.public_ip2}"]
  }

  ingress {
    from_port       = "${var.es-port1}"
    to_port         = "${var.es-port1}"
    protocol        = "tcp"
    cidr_blocks     = ["${var.devops-lab-dev-vpc-cidr}","${var.public_ip1}","${var.public_ip2}"]
  }

  ingress {
    from_port       = "${var.es-port2}"
    to_port         = "${var.es-port2}"
    protocol        = "tcp"
    cidr_blocks     = ["${var.devops-lab-dev-vpc-cidr}","${var.public_ip1}","${var.public_ip2}"]
  }

  ingress {
    from_port       = "${var.es-port3}"
    to_port         = "${var.es-port3}"
    protocol        = "tcp"
    cidr_blocks     = ["${var.devops-lab-dev-vpc-cidr}","${var.public_ip1}","${var.public_ip2}"]
  }

  ingress {
    from_port       = "${var.fluentd-port}"
    to_port         = "${var.fluentd-port}"
    protocol        = "tcp"
    cidr_blocks     = ["${var.devops-lab-dev-vpc-cidr}"]
  }

  ingress {
    from_port      = "${var.kibana-port}"
    to_port        = "${var.kibana-port}"
    protocol       = "tcp"
    cidr_blocks    = ["${var.devops-lab-dev-vpc-cidr}","${var.public_ip1}","${var.public_ip2}"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

 tags = {
    Name = "devops-lab-elasticsearch-sg"
  }
}
