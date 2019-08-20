resource "aws_instance" "jenkins-ec2-instance" {
  ami = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  availability_zone = "${var.az}"
  security_groups = ["${var.security_groups}"]
  associate_public_ip_address = "${var.associate_public_ip_address}"
  subnet_id = "${var.subnet_id}"
  key_name = "${var.key_name}"
  user_data = "${file("user_data/jenkins_user_data.sh")}"

  tags {
    Name = "Jenkins-ec2-instance"
  }
}

resource "aws_volume_attachment" "ec2-ebs-attachment" {
  device_name = "/dev/sdh"
  volume_id   = "${var.volume_id}"
  instance_id = "${aws_instance.jenkins-ec2-instance.id}"
  force_detach = "true"
}
