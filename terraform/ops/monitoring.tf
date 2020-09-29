resource "aws_instance" "devops-elasticsearch-dev-srvr1" {
  ami           = "ami-0817d428a6fb68645"
  instance_type = "t2.large"
  key_name = "${var.key-name}"
  vpc_security_group_ids = ["${aws_security_group.devops-lab-elasticsearch-sg.id}"]
  subnet_id = "${aws_subnet.devops-lab-dev-sn-a.id}"
  
  provisioner "remote-exec" {
    inline = [
      "sudo hostname devops-elasticsearch-dev-srvr1",
      "sudo bash -c 'echo devops-elasticsearch-dev-srvr1 > /etc/hostname'",
      "sudo /usr/bin/perl -pi -ne 's/(^127.0.0.1 localhost)/$1 devops-elasticsearch-dev-srvr1/' /etc/hosts"
    ]

    connection {
      host        = "${self.public_ip}"
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file(var.key)}"
    }
  }

  tags   = {
    type = "devops-elasticsearch-dev"
    env  = "dev"
    Name = "devops-elasticsearch-dev-srvr1"
  }
}

