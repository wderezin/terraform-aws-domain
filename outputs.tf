

output zone {
  value = aws_route53_zone.default
}

output acm {
  value = aws_acm_certificate.cert
}