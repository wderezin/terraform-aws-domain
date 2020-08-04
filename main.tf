
module acm {
  source = "./modules/certificate"
  tags = local.tags
  zone_id = aws_route53_zone.default.zone_id
}
