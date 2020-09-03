
locals {
  zone_id = local.zone_id
  zone_name = local.zone_name
  private_zone = local.private_zone
  zone_vpc_id = local.zone_vpc_id
  zone_tags_match = local.zone_tags_match

  tags        = var.tags

  enable_acm_cert = var.enable_acm_cert
  enable_fastmail = var.enable_fastmail
  enable_mailgun  = var.enable_mailgun

  dns_ttl  = var.ttl
  long_ttl = var.long_ttl

  subdomain_name_servers = var.subdomain_name_servers

  cnames    = var.cnames
  cname_ttl = local.dns_ttl

  txts     = var.txts
  txts_ttl = local.dns_ttl

  fastmail_web_hostname        = var.fastmail_web_hostname
  fastmail_extra_spf           = var.fastmail_extra_spf
  enable_fastmail_mailchimp    = var.enable_fastmail_mailchimp
  fastmail_mailchimp_extra_spf = var.fastmail_mailchimp_extra_spf
}