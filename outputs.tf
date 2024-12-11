output "cluster_name" {
  description = "The EKS cluster name"
  value       = module.eks.cluster_name
}
output "acm_certificate_arn" {
  description = "The Amazon Resource Name (ARN) of the ACM certificate issued by ingress"
  value       = module.eks.acm_certificate_arn
}
output "logscale_s3_bucket_id" {
  description = "Logscale S3 bucket name"
  value       = module.eks.logscale_s3_bucket_id
}
output "service_account_aws_iam_role_arn" {
  description = "The Amazon Resource Name (ARN) of the IAM role for the logscale service account"
  value       = module.eks.service_account_aws_iam_role_arn
}
output "eks_lb_controller_role_arn" {
  description = "The Amazon Resource Name (ARN) of the IAM role for the LB controller"
  value       = module.eks.eks_lb_controller_role_arn
}
output "external_dns_iam_role_arn" {
  description = "The ARN of the IAM role used by ExternalDNS"
  value       = module.eks.external_dns_iam_role_arn
}
output "msk_bootstrap_brokers" {
  description = "One or more DNS names (or IP addresses) and TLS port pairs. This attribute will have a value if `encryption_in_transit_client_broker` is set to `TLS_PLAINTEXT` or `TLS`"
  value       = module.msk.msk_bootstrap_brokers
}
output "zookeeper_connect_string" {
  description = "A comma separated list of one or more hostname:port pairs to use to connect to the Apache Zookeeper cluster."
  value       = module.msk.zookeeper_connect_string
}
output "msk_cluster_arn" {
  description = "Amazon Resource Name (ARN) of the MSK cluster"
  value       = module.msk.msk_cluster_arn
}