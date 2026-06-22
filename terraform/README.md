# Terraform — DNS for supplychain.exposed

Manages the Cloudflare DNS records that point `supplychain.exposed` at GitHub Pages.

The **zone already exists** (Cloudflare Registrar created it when you registered the
domain), so this config does **not** create or manage the zone — only the records in
it. You supply the zone ID.

## Prerequisites

1. **Cloudflare API token** scoped to this zone:
   - Permissions: `Zone → DNS → Edit` and `Zone → Zone → Read`
   - Zone Resources: Include → Specific zone → `supplychain.exposed`
   - Create at: https://dash.cloudflare.com/profile/api-tokens
2. **Zone ID** — dashboard → `supplychain.exposed` → Overview → right-hand **API** panel.

## Usage

```bash
cd terraform
cp terraform.tfvars.example terraform.tfvars   # then paste your zone_id

export CLOUDFLARE_API_TOKEN="<your-scoped-token>"   # not stored in any file

terraform init
terraform plan
terraform apply
```

This creates:

| Record | Type | Target |
| --- | --- | --- |
| `supplychain.exposed` | A (×4) | GitHub Pages IPv4 edge |
| `supplychain.exposed` | AAAA (×4) | GitHub Pages IPv6 edge |
| `www.supplychain.exposed` | CNAME | `0x73746f66.github.io` |

### A note on the orange cloud

`proxied = false` by default. GitHub Pages provisions its own Let's Encrypt
certificate and must see the DNS resolve straight to its edge to do so. Proxying
through Cloudflare before that cert exists causes redirect loops / cert failures.
Once Pages reports the certificate as issued, you *may* set `proxied = true` **and**
switch the zone's SSL/TLS mode to **Full** — but DNS-only is the simplest, working
default and is recommended.

## GitHub Pages side

DNS is only half of it. Tell GitHub the site answers to this domain:

```bash
# Set the custom domain (also writes/confirms the CNAME file in settings):
gh api -X PUT repos/0x73746F66/supplychain-exposed/pages \
  -f cname='supplychain.exposed' -F https_enforced=true
```

…or in the UI: repo → Settings → Pages → Custom domain → `supplychain.exposed`,
then tick **Enforce HTTPS** once the certificate finishes provisioning (can take a
few minutes to ~24h after DNS propagates).

The repo build (`.github/workflows/deploy.yml`) already serves at the apex root: the
canonical `baseURL` lives in `hugo.toml` and `static/CNAME` carries the domain into
the published artifact.

## Provider version

Written for the Cloudflare Terraform provider **v5** (`cloudflare_dns_record`,
`content`). If you are pinned to v4, rename the resources to `cloudflare_record` and
change `content` → `value`.

## State

State is local and gitignored. For a single domain that's fine. If you want a remote
backend later (e.g. an R2/S3 bucket), add a `backend` block to `versions.tf`.
