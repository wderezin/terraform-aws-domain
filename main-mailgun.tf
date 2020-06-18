
resource aws_route53_record mailgun-spf1 {
  count = local.enable_mailgun_count
  zone_id = aws_route53_zone.default.zone_id
  name    = "mg.${aws_route53_zone.default.name}"
  type    = "TXT"
  ttl     = local.dns_ttl

  records = [
    "v=spf1 include:mailgun.org ~all"
  ]
}

resource aws_route53_record mailgun-dk {
  count = local.enable_mailgun_count
  zone_id = aws_route53_zone.default.zone_id
  name    = "smtp._domainkey.mg.${aws_route53_zone.default.name}"
  type    = "TXT"
  ttl     = local.dns_ttl

  records = [
    "k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC/JJGFgQ1Q6ADbsZcko3ZwfPUvCzEedSGCkY8M6MHvJGNrWHm/iAUMWj078yJ7eybIZ/et3v714bDuMTCzYhZfhgY7fDCA0jXbCrktbt1rUoUlwrGuVS6yVRn9laleMlYF6MENOZSMDnaosvQYZrtX24hRwcPGS1nhC9+WtQQFlwIDAQAB"
  ]
}

resource aws_route53_record mailgun-mx-0 {
  count = local.enable_mailgun_count
  zone_id = aws_route53_zone.default.zone_id
  name    = "mg.${aws_route53_zone.default.name}"
  type    = "MX"
  ttl     = local.dns_ttl

  records = [
    "10 mxa.mailgun.org",
    "20 mxb.mailgun.org"
  ]
}

resource aws_route53_record mailgun-email {
  count = local.enable_mailgun_count
  zone_id = aws_route53_zone.default.zone_id
  name    = "email.mg.${aws_route53_zone.default.name}"
  type    = "CNAME"
  ttl     = local.dns_ttl

  records = [
    "mailgun.org"
  ]
}