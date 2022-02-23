
resource "aws_route53_record" "dev_ns" {
  for_each = local.subdomain_name_servers
  name     = "${each.key}.${local.zone_name}"
  ttl      = 86400
  type     = "NS"
  zone_id  = data.aws_route53_zone.default.zone_id

  records = each.value
}