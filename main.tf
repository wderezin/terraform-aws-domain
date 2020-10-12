
module acm {
  count = var.enable_acm_cert ? 1 : 0

  source  = "./modules/certificate"
  tags    = local.tags
  zone_id = aws_route53_zone.default.zone_id
}

module fastmail {
  count = var.enable_fastmail ? 1 : 0

  source  = "./modules/fastmail"
  tags    = local.tags
  zone_id = aws_route53_zone.default.zone_id
  ttl     = local.long_ttl

  extra_spf        = local.fastmail_extra_spf
  enable_mailchimp = local.enable_fastmail_mailchimp
  web_hostname     = local.fastmail_web_hostname
}

module outlook {
  count = var.enable_outlook ? 1 : 0

  source  = "./modules/outlook"
  tags    = local.tags
  zone_id = aws_route53_zone.default.zone_id
  ttl     = local.long_ttl

  mx_prefix = local.outlook_mx_prefix
}

module mailgun {
  count = var.enable_mailgun ? 1 : 0

  source  = "./modules/mailgun"
  tags    = local.tags
  zone_id = aws_route53_zone.default.zone_id
  ttl     = local.long_ttl
}
