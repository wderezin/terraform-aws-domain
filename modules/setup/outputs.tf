output zone {
  value = aws_route53_zone.default
}

output zone_id {
  value = aws_route53_zone.default.zone_id
}

output zone_name {
  value = aws_route53_zone.default.name
}