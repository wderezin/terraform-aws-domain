
output zone {
  value = aws_route53_zone.default
}

output acm {
  value = aws_acm_certificate.cert
}

output acm_arn {
  value = aws_acm_certificate.cert.arn
}