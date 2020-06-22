

resource aws_route53_record cname {
  for_each = local.cnames
  name     = "${each.key}.daringway.com"
  ttl      = local.cname_ttl
  type     = "CNAME"
  zone_id  = aws_route53_zone.default.zone_id

  records = each.value
}

resource aws_route53_record txt {
  for_each = local.txts
  name     = "${each.key}.daringway.com"
  ttl      = local.txts_ttl
  type     = "TXT"
  zone_id  = aws_route53_zone.default.zone_id

  records = each.value
}