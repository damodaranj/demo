resource "aws_s3_bucket" "default" {
  bucket = "devops-node-bucket-made"
}

resource "aws_s3_bucket_object" "default" {
  bucket = "${aws_s3_bucket.default.id}"
  key    = "beanstalk/1.txt"
  source = "1.txt"
}

resource "aws_elastic_beanstalk_application" "default" {
  name        = "devops-node-materials"
  description = "devops-node description"
}

resource "aws_elastic_beanstalk_application_version" "default" {
  name        = "devops-node-materials-label"
  application = "devops-node-materials"
  description = "application version created by terraform"
  bucket      = "${aws_s3_bucket.default.id}"
  key         = "${aws_s3_bucket_object.default.id}"
}
resource "aws_elastic_beanstalk_environment" "tfenvtest" {
  name                = "devops-node-materials-env"
  application         = "${aws_elastic_beanstalk_application.default.name}"
  solution_stack_name = "64bit Amazon Linux 2018.03 v2.14.1 running Docker 18.09.9-ce"
  #solution_stack_name = "64bit Amazon Linux 2018.03 v4.13.0 running Node.js"
}

output "ElasticBeansTalk" {
  value = aws_elastic_beanstalk_environment.tfenvtest.endpoint_url
}