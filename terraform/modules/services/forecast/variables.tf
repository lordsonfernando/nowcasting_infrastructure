
variable "environment" {
  description = "The Deployment environment"
}


variable "region" {
  description = "The AWS region"
}


variable "iam-policy-s3-nwp-read" {
  description = "IAM policy to read to s3 bucket for NWP data"
}

variable "iam-policy-s3-ml-read" {
  description = "IAM policy to read to s3 bucket for ML models"
}

variable "log-group-name" {
  description = "The log group name where log streams are saved"
  default     = "/aws/ecs/forecast/"
}


variable "ecs-cluster" {
  description = "The ECS cluster"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Public subnet ids"
}

variable "iam-policy-rds-read-secret" {
  description = "IAM policy to be able to read the RDS secret"
}

variable "database_secret" {
  description = "AWS secret that gives connection details to the database"
}

variable "docker_version" {
  description = "The version of the docker that should be used"
}
