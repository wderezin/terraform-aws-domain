
locals {
  zone_id         = var.zone_id
  zone_name       = var.zone_name
  private_zone    = var.private_zone
  zone_vpc_id     = var.zone_vpc_id
  zone_tags_match = var.zone_tags_match

  tags = var.tags

  enable_acm_cert = var.enable_acm_cert
  enable_fastmail = var.email_provider == "fastmail"
  enable_mailgun  = var.enable_mailgun

  enable_google_domain    = var.email_provider == "google_domain"
  enable_google_workspace = var.email_provider == "google_workspace"

  enable_outlook    = var.email_provider == "outlook"
  outlook_mx_prefix = var.outlook_mx_prefix

  dns_ttl  = var.ttl
  long_ttl = var.long_ttl

  subdomain_name_servers = var.subdomain_name_servers

  as    = var.as
  as_ttl = local.dns_ttl

  cnames    = var.cnames
  cname_ttl = local.dns_ttl

  txts     = var.txts
  txts_ttl = local.dns_ttl

  fastmail_web_hostname        = var.fastmail_web_hostname
  fastmail_extra_spf           = var.fastmail_extra_spf
  enable_fastmail_mailchimp    = var.enable_fastmail_mailchimp
  fastmail_mailchimp_extra_spf = var.fastmail_mailchimp_extra_spf
}
