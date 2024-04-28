# Default values are set for demonstration and should be tailored to your actual requirements

variable "region_name" {
  description = "Region name to launch VPC network"
  type        = string

}

variable "vpc_cidr_block" {
  description = "VPC network CIDR"
  type        = string
  default     = "10.10.0.0/16"
}

variable "environment" {
  description = "Environment name for deployment"
  type        = string
  default     = "dev"
}

variable "public_subnets" {
  description = "Provider public subnets CIDR values"
  type        = map(any)

}

variable "private_subnets" {
  description = "Provide private subnets CIDR values"
  type        = map(any)

}

variable "pub_sub_tags" {
  description = "Provide tags that needs to be as part of EKS network to manage ELB internet-facing"
  type        = map(any)
  default = {
    "kubernetes.io/role/elb" = "1"
  }
}

variable "priv_sub_tags" {
  description = "Provide tags that needs to be as part of EKS network to manage ELB internal-elb"
  type        = map(any)
  default = {
    "kubernetes.io/role/internal-elb" = "1"
  }
}

locals {
  subnet_common_tags = {
    "kubernetes.io/cluster/var.cluster_name" = "shared"
  }
}

##
