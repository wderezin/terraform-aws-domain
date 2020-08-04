
output zone {
  value = aws_route53_zone.default
}

output acm {
  value = module.acm.acm
}
