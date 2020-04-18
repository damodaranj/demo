resource "aws_s3_bucket" "default" {
  bucket = "devops-node-bucket-made"
}

resource "aws_s3_bucket_object" "default" {
  bucket = "${aws_s3_bucket.default.id}"
  key    = "beanstalk/1.txt"
  source = "1.txt"
}

resource "aws_elastic_beanstalk_application" "default" {
  name        = "devops-node-materials1"
  description = "devops-node description"
}

resource "aws_elastic_beanstalk_application_version" "default" {
  name        = "devops-node-materials1-label"
  application = "devops-node-materials1"
  description = "application version created by terraform"
  bucket      = "${aws_s3_bucket.default.id}"
  key         = "${aws_s3_bucket_object.default.id}"
}
resource "aws_elastic_beanstalk_environment" "tfenvtest" {
  name                = "devops-node-materials1-env"
  application         = "${aws_elastic_beanstalk_application.default.name}"
  solution_stack_name = "64bit Amazon Linux 2 v3.0.0 running Docker"
  #solution_stack_name = "64bit Amazon Linux 2018.03 v4.13.0 running Node.js"
}

output "ElasticBeansTalk" {
  value = aws_elastic_beanstalk_environment.tfenvtest.endpoint_url
}
