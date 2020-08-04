# terraform-aws-domain-setup

A [Daring Way](https://www/daringway.com/) opinionated approach on how to setup your domain (route52) related features in an AWS account.

    Contestant: I'll take AWS for $400 Alex.
    Alex: How do you easily setup everything releated to a public DNS in an AWS account?
    Contestant: What is the Daring Way AWS Domain Setup Terraform Module

NOTE: Support to enable/disable features will be coming once terraform 13 is released.

This modules does the following:
- Create the route53 zone
- Create ACM

Optional:
- Setup subdomains
- Create CNAME records
- Create TXT records

Submodules:
- Fastmail: configure domain for fastmail
- Mailgun: configure doamin for mailgun