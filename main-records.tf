
resource "aws_route53_record" "a" {
  for_each = local.as
  name     = each.key != "" ? "${each.key}.${local.zone_name}" : local.zone_name
  ttl      = local.as_ttl
  type     = "A"
  zone_id  = data.aws_route53_zone.default.zone_id

  records = each.value
}

resource "aws_route53_record" "aaaa" {
  for_each = local.aaaa
  name     = each.key != "" ? "${each.key}.${local.zone_name}" : local.zone_name
  ttl      = local.as_ttl
  type     = "AAAA"
  zone_id  = data.aws_route53_zone.default.zone_id

  records = each.value
}

resource "aws_route53_record" "cname" {
  for_each = local.cnames
  name     = "${each.key}.${local.zone_name}"
  ttl      = local.cname_ttl
  type     = "CNAME"
  zone_id  = data.aws_route53_zone.default.zone_id

  records = each.value
}

resource "aws_route53_record" "txt" {
  for_each = local.txts
  name     = "${each.key}.${local.zone_name}"
  ttl      = local.txts_ttl
  type     = "TXT"
  zone_id  = data.aws_route53_zone.default.zone_id

  records = each.value
}