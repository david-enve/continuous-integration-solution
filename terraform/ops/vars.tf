variable "region" {
  default = "us-east-1"
}

variable "azs" {
  default = ["us-east-1a", "us-east-1b"]
  type    = "list"
}

variable "env" {
  default = "dev"
}

# vpc
variable "devops-lab-dev-vpc-cidr" {
  default = "172.28.0.0/24"
}

variable "devops-lab-dev-sn-a-cidr" {
  default = "172.28.0.0/26"
}

variable "devops-lab-dev-sn-b-cidr" {
  default = "172.28.0.64/26"
}

variable "ssh-port" {
  description = "allow SSH connections"
  default = "22"
}

variable "http-port" {
  description = "allow HTTP requests"
  default = "80"
}

variable "public_ip1" {
  description = "allow own public ip requests"
  default = "181.29.199.10/32"
}

variable "public_ip2" {
  description = "allow own public ip requests"
  default = "201.176.221.104/32"
}

# elasticsearch
variable "es-port1" {
  description = "allow elasticsearch rest api"
  default = "9200"
}

variable "es-port2" {
  description = "allow elasticsearch internal comms "
  default = "9300"
}

variable "es-port3" {
  description = "allow elastic search traffic"
  default = "9600"
}

variable "kibana-port" {
  description = "allow kibana traffic"
  default = "5601"
}

variable "fluentd-port" {
  description = "allow fluentd traffic"
  default = "24224"
}

# keys
variable "key-name" {
  default = "devops-lab-dev"
  description = "server key name"
}

variable "key" {
  default = "/opt/keys/devops-lab-dev.pem"
  description = "server private key"
}


