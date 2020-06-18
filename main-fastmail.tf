
resource aws_route53_record fastmail-mx-0 {
  count = local.enable_fastmail_count
  zone_id = aws_route53_zone.default.zone_id
  name    = aws_route53_zone.default.name
  type    = "MX"
  ttl     = local.dns_ttl

  records = [
    "10 in1-smtp.messagingengine.com.",
    "20 in2-smtp.messagingengine.com"
  ]
}

resource aws_route53_record fastmail-mx-1 {
  count = local.enable_fastmail_count
  zone_id = aws_route53_zone.default.zone_id
  name    = "*.${aws_route53_zone.default.name}"
  type    = "MX"
  ttl     = local.dns_ttl

  records = [
    "10 in1-smtp.messagingengine.com.",
    "20 in2-smtp.messagingengine.com"
  ]
}

resource aws_route53_record fastmail-domainkey {
  count = local.enable_fastmail ? 3 : 0
  zone_id = aws_route53_zone.default.zone_id
  name    = "fm${count.index}._domainkey.${aws_route53_zone.default.name}"
  type    = "CNAME"
  ttl     = local.dns_ttl

  records = [
    "fm${count.index}.${aws_route53_zone.default.name}fmhosted.com."
  ]
}

resource aws_route53_record fastmail-caldav {
  count = local.enable_fastmail_count
  zone_id = aws_route53_zone.default.zone_id
  name    = "_caldavs_.tcp.${aws_route53_zone.default.name}"
  type    = "SRV"
  ttl     = local.dns_ttl

  records = [
    "0 1 443 caldav.fastmail.com."
  ]
}

resource aws_route53_record fastmail-carddav {
  count = local.enable_fastmail_count
  zone_id = aws_route53_zone.default.zone_id
  name    = "_carddav._tcp.${aws_route53_zone.default.name}"
  type    = "SRV"
  ttl     = local.dns_ttl

  records = [
    "0 1 443 carddav.fastmail.com."
  ]
}

resource aws_route53_record fastmail-imaps {
  count = local.enable_fastmail_count
  zone_id = aws_route53_zone.default.zone_id
  name    = "_imaps._tcp.${aws_route53_zone.default.name}"
  type    = "SRV"
  ttl     = local.dns_ttl

  records = [
    "0 1 993 imap.fastmail.com."
  ]
}

resource aws_route53_record fastmail-submission {
  count = local.enable_fastmail_count
  zone_id = aws_route53_zone.default.zone_id
  name    = "_submission._tcp.${aws_route53_zone.default.name}"
  type    = "SRV"
  ttl     = local.dns_ttl

  records = [
    "0 1 587 smtp.fastmail.com."
  ]
}

resource aws_route53_record fastmail-mail {
  count = local.enable_fastmail && local.fastmail_web_hostname != null ? 1 : 0
  zone_id = aws_route53_zone.default.zone_id
  name    = "${local.fastmail_web_hostname}.${aws_route53_zone.default.name}"
  type    = "A"
  ttl     = local.dns_ttl

  records = [
    "66.111.4.147",
    "66.111.4.148"
  ]
}

resource aws_route53_record fastmail-spf {
  count = local.fastmail_extra_spf != null ? 1 : 0
  zone_id = aws_route53_zone.default.zone_id
  name    = aws_route53_zone.default.name
  type    = "SPF"
  ttl     = local.dns_ttl

  records = [
    "v=spf1 include:spf.messagingengine.com ${local.fastmail_extra_spf} ?all"
  ]
}

resource aws_route53_record fastmail-txt {
  count = local.fastmail_extra_spf != null ? 1 : 0
  zone_id = aws_route53_zone.default.zone_id
  name    = aws_route53_zone.default.name
  type    = "TXT"
  ttl     = local.dns_ttl

  records = [
    "v=spf1 include:spf.messagingengine.com ${local.fastmail_extra_spf} ?all"
  ]
}