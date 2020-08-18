
locals {
  dns_zone_name = "your-great-domain.com"
  tags          = {}
}

module domain {
  source      = "github.com/daringway/terraform-aws-domain-setup?ref=prod-test"
  domain_name = local.dns_zone_name
  tags        = local.tags

  enable_fastmail = true
  enable_mailgun  = true
}