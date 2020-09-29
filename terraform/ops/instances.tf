resource "aws_instance" "devops-ci-dev-srvr1" {
  ami           = "ami-0817d428a6fb68645"
  instance_type = "t2.medium"
  key_name = "${var.key-name}"
  vpc_security_group_ids = ["${aws_security_group.devops-lab-dev-sg.id}"]
  subnet_id = "${aws_subnet.devops-lab-dev-sn-a.id}"

  root_block_device {
    volume_size = "20"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo hostname devops-ci-dev-srvr1",
      "sudo bash -c 'echo devops-ci-dev-srvr1 > /etc/hostname'",
      "sudo /usr/bin/perl -pi -ne 's/(^127.0.0.1 localhost)/$1 devops-lab-ci-srvr1/' /etc/hosts",
     ]
 
    connection {
      host = "${self.public_ip}"
      type     = "ssh"
      user     = "ubuntu"
      private_key = "${file(var.key)}"
    }
  }

  tags = {
    type = "devops-ci-dev-srvr"
    env  = "dev"
    Name = "devops-ci-dev-srvr1"
  }
}

