variable "gcp_project_id" {
  description = "The name of the GCP Project where all resources will be launched."
}

variable "gcp_credentials" {
  description = "The name of the GCP Project where all resources will be launched."
}

variable "gcp_region" {
  description = "The region in which all GCP resources will be launched."
}

variable "gcp_zone" {
  description = "The location in which all GCP resources will be launched."
}

variable "alternative_gcp_zone" {
  description = "The alternative location in which all GCP resources will be launched."
}

variable "aws_access_key" {
  description = "access key"
}

variable "aws_secret_key" {
  description = "secret key"
}

variable "region" {
  description = "region"
}

variable "cluster_id" {
  description = "Id to assign the new cluster"
}

variable "namespace" {
  description = "namespace"
}

variable "ssh_key_name" {
  description = "AWS ssh keyname"
}
