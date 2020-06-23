

output zone {
  value = aws_route53_zone.default
}

output acm {
  count = local.create_acm_count
  value = aws_acm_certificate.cert[0]
}