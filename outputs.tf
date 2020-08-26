
output zone {
  value = aws_route53_zone.default
}

output zone_name {
  value = aws_route53_zone.default.name
}

output acm {
  value = local.enable_acm_cert ? module.acm[0].acm : null
}

output acm_arn {
  value = local.enable_acm_cert ? module.acm[0].acm.arn : null
}

output fastmail {
  value = local.enable_fastmail && local.fastmail_web_hostname != null ? module.fastmail[0].web_url : null
}