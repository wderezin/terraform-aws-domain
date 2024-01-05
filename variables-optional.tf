
variable "zone_id" {
  type        = string
  default     = null
  description = "The Hosted Zone id of the desired Hosted Zone to Manage."
}

variable "zone_name" {
  type        = string
  default     = null
  description = "The Host Zone name of the desirect Hosted Zone to Manage"
}

variable "private_zone" {
  type        = bool
  default     = null
  description = "Used with zone_name to get a private Hosted Zone to Manage"
}

variable "zone_vpc_id" {
  type        = string
  default     = null
  description = "Used with zone_name to get a private Hosted Zone associated with the vpc_id to Mange."
}

variable "zone_tags_match" {
  type        = map(any)
  default     = null
  description = "Used zone_name field. A map of tags, each pair of which must exactly match a pair on the desirect Hosted Zone to Mange"
}

variable "ttl" {
  type        = number
  default     = 3600
  description = "Default ttl in seconds."
}

variable "long_ttl" {
  type        = number
  default     = 86400
  description = ""
}

variable "enable_acm_cert" {
  type        = bool
  default     = true
  description = "Configure default ACM Domain"
}

variable "acm_region"  {
  type        = string
  default     = "us-east-1"
  description = "Regions to deploy ACM cert, defaults to us-east-1 for CloudFront"
}

variable "email_provider" {
  type        = string
  default     = null
  description = "Email Provider to configure: google_workspace, google_domain, outlook, fastmail"
  validation {
    condition     = var.email_provider == null || contains(["google_workspace", "google_domain", "outlook", "fastmail"], var.email_provider)
    error_message = "Email Provider not valid."
  }
}

variable "outlook_mx_prefix" {
  type        = string
  default     = null
  description = "The MX prefix to .mail.protection.outlook.com."
}

variable "fastmail_web_hostname" {
  type        = string
  default     = "mail"
  description = "the hostname to access fastmail, such as mail -> mail.acme.com. Set to null to disable"
}

variable "fastmail_extra_spf" {
  type        = string
  default     = ""
  description = "If you need to add extra configuration information to the SPF record."
}

variable "enable_fastmail_mailchimp" {
  type        = bool
  default     = false
  description = "Add the required for SPF and TXT records for mail to be sent from mailchimp."
}

variable "fastmail_mailchimp_extra_spf" {
  type        = string
  default     = null
  description = "Mailchmp SPF record"
}

variable "enable_mailgun" {
  type        = bool
  default     = false
  description = "Configure DNS for mailgun"
}

variable "subdomain_name_servers" {
  type        = map(list(string))
  default     = {}
  description = "A map of <name> : [name servers]"
}

variable "as" {
  type        = map(list(string))
  default     = {}
  description = "A map of <name> : [IPs]"
}

variable "cnames" {
  type        = map(list(string))
  default     = {}
  description = "A map of <name> : [values]"
}

variable "txts" {
  type        = map(list(string))
  default     = {}
  description = "A map of <name> : [values]"
}


