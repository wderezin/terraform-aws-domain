
variable tags {
  type        = map(string)
  description = "List of AWS tags"
}

variable zone_id {
  type        = string
  description = "The route53 zone id"
}


variable ttl {
  type        = number
  description = "The DNS TTL for all records."
}
