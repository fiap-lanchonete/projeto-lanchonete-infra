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

variable "vpc_cidr" {
  description = "VPC CIDR"
  type = string
  default = "10.123.0.0/16"
}

variable "azs" {
  description = "Availability Zones"
  type = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "public_subnets" {
  description = "Public Subnets"
  type = list(string)
  default = ["10.123.1.0/24", "10.123.2.0/24"]
}

variable "private_subnets" {
  description = "Private Subnets"
  type = list(string)
  default = ["10.123.3.0/24", "10.123.4.0/24"]
}

variable "intra_subnets" {
  description = "Intra Subnets"
  type = list(string)
  default = ["10.123.5.0/24", "10.123.6.0/24"]
}

variable "tags" {
  description = "Tags"
  type = map(string)
}

