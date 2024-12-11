variable "aws_region" {
  description = "The AWS region to create resources in."
  type        = string
}
variable "tags" {
  description = "map of tags to be applied to AWS resources"
  type        = map(string)
}
variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
}
variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}
variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}
variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster."
  type        = string
}
variable "ami_type" {
  description = "The AMI type of the logscale managed node group."
  type        = string
}
variable "route53_record_ttl" {
  description = "TTL of the Logscale route53 record"
  type        = number
}
variable "logscale_cluster_type" {
  description = "Logscale cluster type"
  type        = string
  validation {
    condition     = contains(["basic", "ingress", "internal-ingest"], var.logscale_cluster_type)
    error_message = "logscale_cluster_type must be one of: basic, advanced, or internal-ingest"
  }
}
variable "logscale_cluster_size" {
  description = "Logscale cluster size"
  default     = "lab"
  type        = string
  validation {
    condition     = contains(["lab", "xsmall", "small", "medium", "large", "xlarge"], var.logscale_cluster_size)
    error_message = "logscale_cluster_size must be one of: lab, xsmall, small, medium, large, or xlarge"
  }
}
variable "kafka_version" {
  description = "Specify the desired Kafka software version"
  type        = string
}
variable "msk_cluster_name" {
  description = "Name of the MSK cluster"
  type        = string
}
variable "zone_name" {
  description = "Route53 hosted zone domain name"
  type        = string
}
variable "hostname" {
  description = "Hostname of the Logscale cluster"
  type        = string
}
variable "eks_s3_bucket_prefix" {
  description = "The prefix of the LogScale S3 bucket"
  type        = string
  default     = ""
}
variable "name_prefix" {
  description = "the prefix for all resources created"
  type        = string
}