
locals {
  fqdn = var.fqdn

  create_acm_count = var.create_acm ? 1 : 0
  acm_cert_domain  = "*.${local.fqdn}"

  // 5 minutes
  dns_ttl = 3600

  enable_fastmail              = var.enable_fastmail
  enable_fastmail_count        = var.enable_fastmail ? 1 : 0
  fastmail_web_hostname        = var.fastmail_web_hostname
  fastmail_mailchimp_extra_spf = var.fastmail_mailchimp_extra_spf
  fastmail_extra_spf           = var.enable_fastmail_mailchimp ? "include:servers.mcsv.net ${var.fastmail_extra_spf}" : var.fastmail_extra_spf

  enable_mailgun_count = var.enable_mailgun ? 1 : 0

  subdomain_name_servers = var.subdomain_name_servers

  cnames    = var.cnames
  cname_ttl = local.dns_ttl

  txts     = var.txts
  txts_ttl = local.dns_ttl
}