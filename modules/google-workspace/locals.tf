
data aws_route53_zone zone {
  zone_id = var.zone_id
}

locals {
  zone_id     = var.zone_id
  domain_name = data.aws_route53_zone.zone.name

  ttl       = var.ttl
}
