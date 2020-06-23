resource aws_acm_certificate cert {
  domain_name               = local.acm_cert_domain
  subject_alternative_names = local.subject_alternative_names

  validation_method = "DNS"

  //  tags = local.tags

  lifecycle {
    create_before_destroy = false
  }
}

resource aws_route53_record cert_validation {
  name    = aws_acm_certificate.cert.domain_validation_options.0.resource_record_name
  type    = aws_acm_certificate.cert.domain_validation_options.0.resource_record_type
  zone_id = aws_route53_zone.default.zone_id
  records = [
    for value in aws_acm_certificate.cert.domain_validation_options : value.resource_record_value
  ]
  ttl = 60
  lifecycle {
    create_before_destroy = false
  }
}

resource aws_acm_certificate_validation cert {
  depends_on = [ aws_route53_record.cert_validation ]
  certificate_arn = aws_acm_certificate.cert.arn
  validation_record_fqdns = [
    aws_route53_record.cert_validation.fqdn
  ]
}