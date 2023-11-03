variable "region" {
  description = "AWS Region"
  type = string
  default = "us-east-1"
}

variable "name" {
  description = "Name to be applied as identifier"
  type = string
  default = "lanchonete"
  
}
variable "environment" {
  description = "Environment of the application"
  type = string
  default = "prod"
}

variable "coredns_most_recent" {
  description = "Most recent version for coredns"
  type        = bool
  default     = true
}

variable "kube_proxy_most_recent" {
  description = "Most recent version for kube-proxy"
  type        = bool
  default     = true
}

variable "vpc_cni_most_recent" {
  description = "Most recent version for vpc-cni"
  type        = bool
  default     = true
}

variable "ami_type" {
  description = "The type of Amazon Machine Image (AMI)"
  type        = string
  default     = "AL2_x86_64"
}

variable "instance_types" {
  description = "The instance types to use for the EKS nodes"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "attach_cluster_primary_security_group" {
  description = "Whether to attach the cluster's primary security group to the EKS nodes"
  type        = bool
  default     = true
}

variable "min_size" {
  description = "Minimum size of the node group"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum size of the node group"
  type        = number
  default     = 2
}

variable "desired_size" {
  description = "Desired size of the node group"
  type        = number
  default     = 1
}

variable "capacity_type" {
  description = "The capacity type for the EKS nodes"
  type        = string
  default     = "SPOT"
}

variable "cluster_name_tag" {
  description = "The name tag for the EKS cluster"
  type        = string
  default     = "lanchonete_cluster"
}
