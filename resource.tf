provider "aws" {
    region     = "us-east-1"
}

# instances
resource "aws_instance" "jboss" {
  count                       = 1
  ami                         = "${var.ami}"
  availability_zone           = "${var.availability_zone}"
  instance_type               = "${var.inst_type}"
  tags {
        Name = "jboss"
    }
  key_name                    = "${var.key_name}"
  subnet_id                   = "${var.vpc_public_sn_id}"
  associate_public_ip_address =  "True"
  security_groups = [
    "${var.vpc_public_sg_id}"
  ]


  provisioner  "local-exec" {
     command = "sleep 100; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ec2-user  -i '${aws_instance.jboss.public_ip},' --private-key  /root/jboss/jenkins.pem jboss.yml"
  }
  provisioner "local-exec" {
     command = "sleep 100; echo ${aws_instance.jboss.public_ip} >> inventory"
  }

  provisioner "local-exec" {
     command = "sleep 100; sh output.sh '${aws_instance.jboss.public_ip},' inventory ec2-user /root/jboss/jenkins.pem"
  }
}

