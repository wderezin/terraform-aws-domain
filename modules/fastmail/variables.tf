
variable tags {
  type        = map(string)
  description = "List of AWS tags"
}

variable zone_id {
  type        = string
  description = "The route53 zone id"
}

variable extra_spf {
  type        = string
  description = "If you need to add extra configuration information to the SPF record."
}

variable ttl {
  type        = number
  description = "The DNS TTL for all records."
}

variable enable_mailchimp {
  type        = bool
  description = "Add the required for SPF and TXT records for mail to be sent from mailchimp."
}

variable web_hostname {
  type        = string
  description = "The hostname to use for web access."
}
