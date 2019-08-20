#!/bin/bash
lsblk

file -s /dev/xvdh
mkfs -t xfs /dev/xvdh
mkdir -p /var/lib/jenkins
mount /dev/xvdh /var/lib/jenkins

yum update -y

yum install java -y 
java --version

wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key

yum install jenkins -y
systemctl start jenkins
systemctl enable jenkins
systemctl status jenkins
