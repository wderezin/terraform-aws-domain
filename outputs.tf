
output zone {
  value = aws_route53_zone.default
}

output acm {
  value = module.acm.acm
}

output acm_arn {
  value = module.acm.acm.arn
}