
resource aws_route53_record mx {
  zone_id = local.zone_id
  name    = local.domain_name
  type    = "MX"
  ttl     = local.ttl

  records = [
    "0 ${local.mx_record}"
  ]
}

resource aws_route53_record autodiscover {
  zone_id = local.zone_id
  name    = "autodiscover.${local.domain_name}"
  type    = "CNAME"
  ttl     = local.ttl

  records = [
    "autodiscover.outlook.com"
  ]
}

resource aws_route53_record txt {
  zone_id = local.zone_id
  name    = local.domain_name
  type    = "TXT"
  ttl     = local.ttl

  records = [
    "v=spf1 include:spf.protection.outlook.com -all"
  ]
}
