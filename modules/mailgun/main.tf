
resource aws_route53_record mailgun-spf1 {
  zone_id = local.zone_id
  name    = "mg.${local.domain_name}"
  type    = "TXT"
  ttl     = local.ttl

  records = [
    "v=spf1 include:mailgun.org ~all"
  ]
}

resource aws_route53_record mailgun-dk {
  zone_id = local.zone_id
  name    = "smtp._domainkey.mg.${local.domain_name}"
  type    = "TXT"
  ttl     = local.ttl

  records = [
    "k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC/JJGFgQ1Q6ADbsZcko3ZwfPUvCzEedSGCkY8M6MHvJGNrWHm/iAUMWj078yJ7eybIZ/et3v714bDuMTCzYhZfhgY7fDCA0jXbCrktbt1rUoUlwrGuVS6yVRn9laleMlYF6MENOZSMDnaosvQYZrtX24hRwcPGS1nhC9+WtQQFlwIDAQAB"
  ]
}

resource aws_route53_record mailgun-dk2 {
  zone_id = local.zone_id
  name    = "krs._domainkey.mg.${local.domain_name}"
  type    = "TXT"
  ttl     = local.ttl

  records = [
    "k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC5SixmhllsQ2bmm2+mZjW/mh3cNCs9J3w+F8Aey524FfYhV2qCGBK48eLyAVd5e0D2sakk1gWDMMIYD73SMwjcUc+C1K5GMYqws/+rR85AUuCXf91AmZZs+osyjv92cNKVUYJg4CiSDcUaN6WW6Hvarmqpv2cdNkK+LKqF8NLBfQIDAQAB"
  ]
}

resource aws_route53_record mailgun-mx-0 {
  zone_id = local.zone_id
  name    = "mg.${local.domain_name}"
  type    = "MX"
  ttl     = local.ttl

  records = [
    "10 mxa.mailgun.org",
    "20 mxb.mailgun.org"
  ]
}

resource aws_route53_record mailgun-email {
  zone_id = local.zone_id
  name    = "email.mg.${local.domain_name}"
  type    = "CNAME"
  ttl     = local.ttl

  records = [
    "mailgun.org"
  ]
}