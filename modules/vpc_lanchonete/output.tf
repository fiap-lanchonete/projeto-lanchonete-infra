output "azs" {
  description = "Availability Zones"
  value       = module.vpc.azs
}

output "private_subnets" {
  description = "Private Subnets"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "Public Subnets"
  value       = module.vpc.public_subnets
}

output "intra_subnets" {
  description = "Intra Subnets"
  value       = module.vpc.intra_subnets
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}
