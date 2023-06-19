variable "domain_name" {
  description = "domain name (or application name if no domain name available)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "tags for all the resources, if any"
}

variable "hosted_zone" {
  default     = null
  description = "Route53 hosted zone"
}

variable "acm_certificate_domain" {
  default     = null
  description = "Domain of the ACM certificate"
}

variable "price_class" {
  default     = "PriceClass_100" // Only US,Canada,Europe
  description = "CloudFront distribution price class"
}

variable "use_default_domain" {
  default     = false
  description = "Use CloudFront website address without Route53 and ACM certificate"
}

variable "upload_sample_file" {
  default     = false
  description = "Upload sample html file to s3 bucket"
}

variable "web_acl_id" {
  default     = null
  type        = string
  description = "web acl id for the cdn"
}

variable "s3_sse_configuration" {
  type        = map(object({
    bucket_key_enabled     = bool
    apply_sse_by_default   = map(string)
  }))
  default     = {
    conf = {
      bucket_key_enabled     = false
      apply_sse_by_default   = {
        "sse_algorithm"      = "AES256"
      }
    }
  }
  description = "s3 server side encryption configuration"
}
