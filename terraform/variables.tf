variable "api_token" {
  description = <<-EOT
    Cloudflare API token, scoped to Zone > DNS > Edit and Zone > Zone > Read for
    supplychain.exposed. Set it in the gitignored terraform.tfvars (never committed).
    Leave null to fall back to the CLOUDFLARE_API_TOKEN environment variable instead.
  EOT
  type        = string
  sensitive   = true
  default     = null
}

variable "zone_id" {
  description = "Cloudflare zone ID for supplychain.exposed. Find it on the domain's Overview page in the dashboard (right-hand 'API' panel)."
  type        = string
}

variable "account_id" {
  description = "Cloudflare account ID. The zone-scoped DNS records here need only zone_id, so this is not consumed today; it is stored for completeness and any future account-scoped resources."
  type        = string
  default     = null
}

variable "domain" {
  description = "The apex domain served by GitHub Pages."
  type        = string
  default     = "supplychain.exposed"
}

variable "github_pages_target" {
  description = "Your GitHub Pages host, used as the CNAME target for the www subdomain."
  type        = string
  default     = "0x73746f66.github.io"
}

variable "proxied" {
  description = <<-EOT
    Whether to proxy the records through Cloudflare (orange cloud).
    Keep this false: GitHub Pages provisions its own Let's Encrypt certificate
    and needs the DNS records to resolve directly to its edge. Flip to true only
    after the cert is issued and after setting the zone's SSL/TLS mode to "Full".
  EOT
  type        = bool
  default     = false
}

variable "manage_www" {
  description = "Create a www.<domain> CNAME pointing at GitHub Pages (GitHub redirects it to the apex)."
  type        = bool
  default     = true
}
