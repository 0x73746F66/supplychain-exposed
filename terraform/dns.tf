locals {
  # GitHub Pages apex addresses. Stable and documented:
  # https://docs.github.com/pages/configuring-a-custom-domain-for-your-github-pages-site
  github_pages_ipv4 = [
    "185.199.108.153",
    "185.199.109.153",
    "185.199.110.153",
    "185.199.111.153",
  ]

  github_pages_ipv6 = [
    "2606:50c0:8000::153",
    "2606:50c0:8001::153",
    "2606:50c0:8002::153",
    "2606:50c0:8003::153",
  ]
}

# Apex A records -> GitHub Pages edge.
resource "cloudflare_dns_record" "apex_a" {
  for_each = toset(local.github_pages_ipv4)

  zone_id = var.zone_id
  name    = var.domain
  type    = "A"
  content = each.value
  ttl     = 1 # 1 = automatic
  proxied = var.proxied
  comment = "GitHub Pages apex (managed by Terraform)"
}

# Apex AAAA records -> GitHub Pages edge (IPv6).
resource "cloudflare_dns_record" "apex_aaaa" {
  for_each = toset(local.github_pages_ipv6)

  zone_id = var.zone_id
  name    = var.domain
  type    = "AAAA"
  content = each.value
  ttl     = 1
  proxied = var.proxied
  comment = "GitHub Pages apex IPv6 (managed by Terraform)"
}

# www subdomain -> GitHub Pages host. GitHub serves a redirect to the apex.
resource "cloudflare_dns_record" "www" {
  count = var.manage_www ? 1 : 0

  zone_id = var.zone_id
  name    = "www.${var.domain}"
  type    = "CNAME"
  content = var.github_pages_target
  ttl     = 1
  proxied = var.proxied
  comment = "www -> GitHub Pages (managed by Terraform)"
}
