
variable tags {
  type        = map(string)
  description = "List of AWS tags"
}

variable domain_name {
  type        = string
  description = "fully qualify domain name such as acme.com"
}