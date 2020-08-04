
output zone {
  value = aws_route53_zone.default
}

output cert {
  value = aws_acm_certificate.cert
}