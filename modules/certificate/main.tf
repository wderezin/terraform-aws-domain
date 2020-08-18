resource aws_acm_certificate cert {
  domain_name               = local.acm_cert_domain
  subject_alternative_names = local.subject_alternative_names

  validation_method = "DNS"

  tags = local.tags

  lifecycle {
    create_before_destroy = false
  }
}

resource aws_route53_record cert_validation {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = local.zone_id
}