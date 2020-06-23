
output zone {
  value = aws_route53_zone.default
}

output acm {
  value = local.create_acm ? aws_acm_certificate.cert[0] : null
}