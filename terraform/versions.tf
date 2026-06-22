terraform {
  required_version = ">= 1.6.0"

  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      # v5 schema: `cloudflare_dns_record` with `content` (not the v4 `cloudflare_record` + `value`).
      version = "~> 5.0"
    }
  }
}

# The API token is read from the CLOUDFLARE_API_TOKEN environment variable.
# Scope it to: Zone > DNS > Edit and Zone > Zone > Read, limited to the
# supplychain.exposed zone. Do not hard-code it here.
provider "cloudflare" {}
