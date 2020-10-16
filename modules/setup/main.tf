
resource aws_route53_zone default {
  name = local.domain_name
  tags = local.tags
}