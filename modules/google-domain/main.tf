
resource aws_route53_record mx {
  zone_id = local.zone_id
  name    = local.domain_name
  type    = "MX"
  ttl     = local.ttl

  records = [
    "5 	gmr-smtp-in.l.google.com",
    "10 alt1.gmr-smtp-in.l.google.com",
    "20 alt2.gmr-smtp-in.l.google.com",
    "30 alt3.gmr-smtp-in.l.google.com",
    "40 alt4.gmr-smtp-in.l.google.com"
  ]
}
