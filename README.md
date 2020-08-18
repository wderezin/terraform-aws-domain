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

# Fastmail

Adds the needed DNS records to an AWS Route53 zone.  The following items are added.

- MX records for in1-smtp.messagingengine.com and in2-smtp.messagingengine.com.
- SPF records
- The _domainkey record for fastmail to validate the domain
- CALDAV auto discovery record
- CARDDAV auto discovery record
- IMAPS auto discovery record
- SUBMISSION auto discovery record
- Configure web access with default mail.<domain>
- Optional configuration for mailchimp to send mail as your domain

[Semantic Version](https://semver.org) is being applied to the modules. 

1. MAJOR version requires a change. 
    - upgrading to new version of terraform
    - variable name changes
    - new variable without a default value
    - changes that will require manually updating the terraform.tfstate file such as a `terraform state mv`
    - changes that will require resources being destroy and created that require external terraform application configuration
2. MINOR version add new functionality in a backwards compatible manner
    - new variable with default value
3. PATCH version have backwards compatible bug fixes