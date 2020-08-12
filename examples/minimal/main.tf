
locals {
  dns_zone_name = "your-great-domain.com"
  tags          = {}
}

module domain {
  source      = "github.com/daringway/terraform-aws-domain-setup?ref=prod-test"
  domain_name = local.dns_zone_name
  tags        = local.tags
}

// Optional, will be integrated into module in terraform 13
module fastmail {
  source  = "github.com/daringway/terraform-aws-domain-setup//modules/fastmail?ref=prod-test"
  zone_id = module.domain.zone.zone_id
  tags    = local.tags
}

// Optional, will be integrated into module in terraform 13
module mailgun {
  source  = "github.com/daringway/terraform-aws-domain-setup//modules/mailgun?ref=prod-test"
  zone_id = module.domain.zone.zone_id
  tags    = local.tags
}