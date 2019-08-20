resource "aws_security_group" "jenkins_security_group" {
  name = "jenkins_security_group"
  description = "This will allow ports 8080 and 22"

  vpc_id = "${var.vpc_id}"

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name = "jenkins_security_group"
  }
}

output "jenkins_security_group_id" {
  value = "${aws_security_group.jenkins_security_group.id}"
}
