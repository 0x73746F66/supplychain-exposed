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

# The API token comes from var.api_token (set in the gitignored terraform.tfvars).
# If that is null it falls back to the CLOUDFLARE_API_TOKEN environment variable.
# Scope it to: Zone > DNS > Edit and Zone > Zone > Read, limited to the
# supplychain.exposed zone. Never commit it — terraform.tfvars is gitignored.
provider "cloudflare" {
  api_token = var.api_token
}
