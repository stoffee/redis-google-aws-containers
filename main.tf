provider "google" {
  region      = "${var.gcp_region}"
  credentials = "${var.gcp_credentials}"
}


provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.region}"
}

terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "cdunlap"

    workspaces {
      name = "redis-fargate-demo"
    }
  }
  required_version = ">= 0.11.13"
}

module "gcp-redis" {
# When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
 # to a specific version of the modules, such as the following example:
 # source = "modules/vault-cluster"
 source = "git::https://github.com/stoffee/redis-gke-demo.git/modules/redis"
  gcp_region      = "${var.gcp_region}"
  gcp_credentials = "${var.gcp_credentials}"
  gcp_project_id = "${var.gcp_project_id}"
  gcp_zone = "${var.gcp_zone}"
  alternative_gcp_zone = "${var.alternative_gcp_zone}"
  namespace = "${var.namespace}"

}

module "gke" {
# When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
 # to a specific version of the modules, such as the following example:
 # source = "modules/vault-cluster"
 source = "git::https://github.com/stoffee/redis-gke-demo.git/modules/gke"
  gcp_region      = "${var.gcp_region}"
  gcp_credentials = "${var.gcp_credentials}"
  gcp_project_id = "${var.gcp_project_id}"
  gcp_zone = "${var.gcp_zone}"
  alternative_gcp_zone = "${var.alternative_gcp_zone}"
  namespace = "${var.namespace}"

}

 module "aws-redis" {
 # When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
  # to a specific version of the modules, such as the following example:
  # source = "modules/vault-cluster"
  source = "git::https://github.com/stoffee/redis-fargate-demo.git/modules/redis"


  aws_access_key = "${var.aws_access_key}"
  aws_secret_key = "${var.aws_secret_key}"
  region = "${var.region}"
  cluster_id = "${var.cluster_id}"
  namespace = "${var.namespace}"
  ssh_key_name = "${var.ssh_key_name}"
}


 module "fargate" {
 # When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
  # to a specific version of the modules, such as the following example:
  # source = "modules/vault-cluster"
  source = "git::https://github.com/stoffee/redis-fargate-demo.git/modules/fargate"


  aws_access_key = "${var.aws_access_key}"
  aws_secret_key = "${var.aws_secret_key}"
  aws_region = "${var.region}"
#  cluster_id = "${var.cluster_id}"
#  namespace = "${var.namespace}"
#  ssh_key_name = "${var.ssh_key_name}"
}
