
resource aws_route53_record mx-0 {
  zone_id = local.zone_id
  name    = local.domain_name
  type    = "MX"
  ttl     = local.ttl

  records = [
    "10 in1-smtp.messagingengine.com.",
    "20 in2-smtp.messagingengine.com"
  ]
}

resource aws_route53_record mx-1 {
  zone_id = local.zone_id
  name    = "*.${data.aws_route53_zone.zone.name}"
  type    = "MX"
  ttl     = local.ttl

  records = [
    "10 in1-smtp.messagingengine.com.",
    "20 in2-smtp.messagingengine.com"
  ]
}

resource aws_route53_record spf {
  zone_id = local.zone_id
  name    = local.domain_name
  type    = "SPF"
  ttl     = local.ttl

  records = [
    "v=spf1 include:spf.messagingengine.com ${local.extra_spf} ?all"
  ]
}

resource aws_route53_record txt {
  zone_id = local.zone_id
  name    = local.domain_name
  type    = "TXT"
  ttl     = local.ttl

  records = [
    "v=spf1 include:spf.messagingengine.com ${local.extra_spf} ?all"
  ]
}

resource aws_route53_record domainkey {
  count   = 3
  zone_id = local.zone_id
  name    = "fm${count.index}._domainkey.${local.domain_name}"
  type    = "CNAME"
  ttl     = local.ttl

  records = [
    "fm${count.index}.${local.domain_name}.fmhosted.com."
  ]
}

resource aws_route53_record caldav {
  zone_id = local.zone_id
  name    = "_caldavs_.tcp.${local.domain_name}"
  type    = "SRV"
  ttl     = local.ttl

  records = [
    "0 1 443 caldav.fastmail.com."
  ]
}

resource aws_route53_record carddav {
  zone_id = local.zone_id
  name    = "_carddav._tcp.${local.domain_name}"
  type    = "SRV"
  ttl     = local.ttl

  records = [
    "0 1 443 carddav.fastmail.com."
  ]
}

resource aws_route53_record imaps {
  zone_id = local.zone_id
  name    = "_imaps._tcp.${local.domain_name}"
  type    = "SRV"
  ttl     = local.ttl

  records = [
    "0 1 993 imap.fastmail.com."
  ]
}

resource aws_route53_record submission {
  zone_id = local.zone_id
  name    = "_submission._tcp.${local.domain_name}"
  type    = "SRV"
  ttl     = local.ttl

  records = [
    "0 1 587 smtp.fastmail.com."
  ]
}

resource aws_route53_record mail {
  count = local.web_hostname == null ? 0 : 1

  zone_id = local.zone_id
  name    = "${local.web_hostname}.${local.domain_name}"
  type    = "A"
  ttl     = local.ttl

  records = [
    "66.111.4.147",
    "66.111.4.148"
  ]
}