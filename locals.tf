
locals {
  tags        = var.tags
  domain_name = var.domain_name

  // 5 minutes
  dns_ttl = 3600

  subdomain_name_servers = var.subdomain_name_servers

  cnames    = var.cnames
  cname_ttl = local.dns_ttl

  txts     = var.txts
  txts_ttl = local.dns_ttl
}