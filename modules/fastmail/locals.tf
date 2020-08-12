
data aws_route53_zone zone {
  zone_id = var.zone_id
}

locals {
  zone_id     = var.zone_id
  domain_name = data.aws_route53_zone.zone.name

  ttl          = var.ttl
  extra_spf    = var.enable_mailchimp ? "include:servers.mcsv.net ${var.extra_spf}" : var.extra_spf
  web_hostname = var.web_hostname


}