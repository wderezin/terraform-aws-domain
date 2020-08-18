
output web_url {
  value = local.web_hostname == null ? null : "https://${aws_route53_record.mail[0].fqdn}"
}