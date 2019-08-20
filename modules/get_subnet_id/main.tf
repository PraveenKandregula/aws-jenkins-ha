data "aws_subnet_ids" "get_subnet_id" {
  vpc_id = "${var.vpc_id}"
  
  #filter {
    #name = "tag:name"
    #values = ["preferred"]
  #}
}

output "jenkins-aws-subnet-id" {
  value = "${data.aws_subnet_ids.get_subnet_id.id}"
}
