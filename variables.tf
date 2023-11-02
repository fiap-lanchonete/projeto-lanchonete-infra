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
