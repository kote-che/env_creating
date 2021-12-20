provider "aws" {
  region                 = local.region
}

locals {
  region                 = "us-east-1"
}

data "aws_eks_cluster" "eks" {
  name                   = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "eks" {
  name                   = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks.token
}

module "eks" {
  source                 = "terraform-aws-modules/eks/aws"

  cluster_version        = var.cluster_version
  cluster_name           = var.env_name
  vpc_id                 = var.vpc_id
  subnets                = var.subnets

  worker_groups = [
    {
      instance_type      = var.instance_type
      asg_desired_capacity = var.asg_desired_capacity
    }
  ]
}

resource "aws_ecr_repository" "docker_repo" {
  name                   = "my_application"
  image_tag_mutability   = "MUTABLE"

  image_scanning_configuration {
    scan_on_push         = true
  }
}