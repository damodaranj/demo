resource "aws_s3_bucket" "default" {
  bucket = "devops-node-bucket-made"
}

resource "aws_s3_bucket_object" "default" {
  bucket = "${aws_s3_bucket.default.id}"
  key    = "beanstalk/1.txt"
  source = "1.txt"
}

resource "aws_elastic_beanstalk_application" "default" {
  name        = "damo-node-materials"
  description = "damo-node description"
}

resource "aws_elastic_beanstalk_application_version" "default" {
  name        = "damo-node-materials-label"
  application = "damo-node-materials"
  description = "application version created by terraform"
  bucket      = "${aws_s3_bucket.default.id}"
  key         = "${aws_s3_bucket_object.default.id}"
}
resource "aws_elastic_beanstalk_environment" "tfenvtest" {
  name                = "damo-node-materials-env"
  application         = "${aws_elastic_beanstalk_application.default.name}"
  solution_stack_name = "64bit Amazon Linux 2 v3.0.0 running Docker"
  #solution_stack_name = "64bit Amazon Linux 2018.03 v4.13.0 running Node.js"
setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "IamInstanceProfile"
    value = "aws-elasticbeanstalk-ec2-role"
  }
}

output "ElasticBeansTalk" {
  value = aws_elastic_beanstalk_environment.tfenvtest.endpoint_url
}
