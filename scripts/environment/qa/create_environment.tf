provider "aws" {
  region = "eu-west-2"
}

resource "aws_elastic_beanstalk_environment" "webapi2-qa" {
  name = "webapi2-qa"
  application = "webapi2"
  solution_stack_name = "64bit Windows Server 2012 R2 running IIS 8.5"
  cname_prefix = "webapi2-qa"
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "IamInstanceProfile"
    value = "aws-elasticbeanstalk-ec2-role"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name = "VPCId"
    value = "vpc-fe1fcd97"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name = "AssociatePublicIpAddress"
    value = "true"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name = "Subnets"
    value = "subnet-b072b5cb,subnet-1fe8f155"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name = "ELBSubnets"
    value = "subnet-b072b5cb,subnet-1fe8f155"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name = "ELBScheme"
    value = "public"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "InstanceType"
    value = "t2.micro"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "EC2KeyName"
    value = "LenderSquad-Pem"
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name = "Availability Zones"
    value = "Any 2"
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name = "MinSize"
    value = "2"
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name = "MaxSize"
    value = "3"
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name = "ServiceRole"
    value = "aws-elasticbeanstalk-service-role"
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name = "EnvironmentType"
    value = "LoadBalanced"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name = "environment"
    value = "qa"
  }
  setting {
    namespace = "aws:elasticbeanstalk:healthreporting:system"
    name = "SystemType"
    value = "basic"
  }
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name = "RollingUpdateEnabled"
    value = "true"
  }
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name = "RollingUpdateType"
    value = "Health"
  }
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name = "MinInstancesInService"
    value = "2"
  }
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name = "MaxBatchSize"
    value = "1"
  }
  setting {
    namespace = "aws:elb:loadbalancer"
    name = "CrossZone"
    value = "true"
  }
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name = "BatchSizeType"
    value = "Fixed"
  }
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name = "BatchSize"
    value = "1"
  }
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name = "DeploymentPolicy"
    value = "Rolling"
  }
  setting {
    namespace = "aws:elb:policies"
    name = "ConnectionDrainingEnabled"
    value = "true"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "SecurityGroups"
    value = "sg-aca110c5"
  }
  setting {
    namespace = "aws:elb:healthcheck"
    name = "HealthyThreshold"
    value = "2"
  }
  setting {
    namespace = "aws:elb:healthcheck"
    name = "Interval"
    value = "10"
  } 
  setting {
    namespace = "aws:elb:healthcheck"
    name = "Target"
    value = "HTTP:80/api/status"
  }
  setting {
    namespace = "aws:elb:healthcheck"
    name = "Timeout"
    value = "5"
  }
  setting {
    namespace = "aws:elb:healthcheck"
    name = "UnhealthyThreshold"
    value = "3"
  }
  tags {
    Team = "LenderSquuad"
    Environment = "QA"
  }
}

resource "aws_auto_scaling_group" "webapi2-qa" { 
 setting {
    namespace = "aws::autoscaling::autoscalinggroup"
    name = "HealthCheckType"
    value = "ELB"
  }
}