
variable subdomain_name_servers {
  type        = map(list(string))
  default     = {}
  description = "A map of <name> : [name servers]"
}

variable cnames {
  type        = map(list(string))
  default     = {}
  description = "A map of <name> : [values]"
}

variable txts {
  type        = map(list(string))
  default     = {}
  description = "A map of <name> : [values]"
}