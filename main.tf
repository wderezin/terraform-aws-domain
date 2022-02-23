
data "aws_route53_zone" "default" {
  zone_id      = local.zone_id
  name         = local.zone_name
  private_zone = local.private_zone
  vpc_id       = local.zone_vpc_id
  tags         = local.zone_tags_match
}


module "acm" {
  count = var.enable_acm_cert ? 1 : 0

  source  = "./modules/certificate"
  tags    = local.tags
  zone_id = data.aws_route53_zone.default.zone_id
}

module "fastmail" {
  count = local.enable_fastmail ? 1 : 0

  source  = "./modules/fastmail"
  tags    = local.tags
  zone_id = data.aws_route53_zone.default.zone_id
  ttl     = local.long_ttl

  extra_spf        = local.fastmail_extra_spf
  enable_mailchimp = local.enable_fastmail_mailchimp
  web_hostname     = local.fastmail_web_hostname
}

module "outlook" {
  count = local.enable_outlook ? 1 : 0

  source  = "./modules/outlook"
  tags    = local.tags
  zone_id = data.aws_route53_zone.default.zone_id
  ttl     = local.long_ttl

  mx_prefix = local.outlook_mx_prefix
}

module "google_domain" {
  count = local.enable_google_domain ? 1 : 0

  source  = "./modules/google-domain"
  tags    = local.tags
  zone_id = data.aws_route53_zone.default.zone_id
  ttl     = local.long_ttl
}

module "google_workspace" {
  count = local.enable_google_workspace ? 1 : 0

  source  = "./modules/google-workspace"
  tags    = local.tags
  zone_id = data.aws_route53_zone.default.zone_id
  ttl     = local.long_ttl
}

module "mailgun" {
  count = var.enable_mailgun ? 1 : 0

  source  = "./modules/mailgun"
  tags    = local.tags
  zone_id = data.aws_route53_zone.default.zone_id
  ttl     = local.long_ttl
}
