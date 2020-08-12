data aws_route53_zone zone {
  zone_id = var.zone_id
}

data aws_caller_identity current {}

data aws_region current {}

locals {
  tags        = var.tags
  domain_name = data.aws_route53_zone.zone.name
  zone_id     = data.aws_route53_zone.zone.zone_id

  acm_cert_domain           = "*.${local.domain_name}"
  subject_alternative_names = [local.domain_name]
}

