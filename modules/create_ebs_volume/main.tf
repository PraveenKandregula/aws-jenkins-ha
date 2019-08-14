resource "aws_ebs_volume" "jenkins-ebs-volume" {
  availability_zone = "${var.az}"
  size              = "${var.ebs_size}"

  tags = {
    Name = "jenkins-volume"
  }
}

output "ebs_volume_id" {
  value = "${aws_ebs_volume.jenkins-ebs-volume.id}"
}
