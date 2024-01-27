terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.34.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = "default"  # Utiliza o perfil configurado no AWS CLI
}

module "vpc_lanchonete" {
  source = "./modules/vpc_lanchonete"
  tags = {
    Name        = var.name
    Environment = var.environment
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.21.0"

  cluster_name                   = var.name
  cluster_endpoint_public_access = true

  cluster_tags = {
    "kubernetes.io/cluster/${var.name}" = null
  }

  cluster_addons = {
    coredns = {
      most_recent = var.coredns_most_recent
    }
    kube-proxy = {
      most_recent = var.kube_proxy_most_recent
    }
    vpc-cni = {
      most_recent = var.vpc_cni_most_recent
    }
  }

  vpc_id                   = module.vpc_lanchonete.vpc_id
  subnet_ids               = module.vpc_lanchonete.private_subnets
  control_plane_subnet_ids = module.vpc_lanchonete.intra_subnets

  eks_managed_node_group_defaults = {
    ami_type       = var.ami_type
    instance_types = var.instance_types
    attach_cluster_primary_security_group = var.attach_cluster_primary_security_group
  }

  eks_managed_node_groups = {
    lanchonete_cluster_wg = {
      min_size     = var.min_size
      max_size     = var.max_size
      desired_size = var.desired_size

      instance_types = var.instance_types
      capacity_type  = var.capacity_type

      tags = {
        Name = var.cluster_name_tag
      }
    }
  }

  tags = {
    Name        = var.name
    Environment = var.environment
  }
}
