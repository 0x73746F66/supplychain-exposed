# supplychain.exposed — repo task runner
#
# A Hugo (extended) static site, published to GitHub Pages on push to `main`,
# with DNS managed by Terraform (Cloudflare). Run `just` to list recipes.
#
# Requires: hugo (extended), git, gh; terraform only for the dns-* recipes.

# Hugo version pinned to match .github/workflows/deploy.yml — keep in sync.
hugo_version := "0.163.3"
repo         := "0x73746F66/supplychain-exposed"
domain       := "supplychain.exposed"
port         := "1313"

# Show the recipe list (default when you run `just`).
default:
    @just --list --unsorted

# ── Develop ────────────────────────────────────────────────────────────────

# Live preview with hot reload at http://localhost:1313/
serve:
    hugo server --port {{port}} --bind 127.0.0.1

# Preview including draft, future-dated, and expired content.
preview:
    hugo server --port {{port}} --bind 127.0.0.1 -D -F -E

# Production build into ./public — byte-for-byte what CI publishes.
build:
    hugo --gc --minify

# Remove generated output and caches.
clean:
    rm -rf public resources/_gen .hugo_build.lock

# Build clean from scratch (clean + build).
rebuild: clean build

# ── Authoring ──────────────────────────────────────────────────────────────

# Scaffold a new chapter: `just new-chapter 09 "The Title" 9`
new-chapter num title weight:
    #!/usr/bin/env sh
    set -eu
    slug=$(printf '%s' "{{title}}" | tr '[:upper:]' '[:lower:]' | tr -cs 'a-z0-9' '-' | sed 's/^-//;s/-$//')
    file="content/chapters/{{num}}-${slug}.md"
    if [ -e "$file" ]; then echo "refusing to overwrite $file" >&2; exit 1; fi
    cat > "$file" <<EOF
    ---
    title: "{{title}}"
    weight: {{weight}}
    slug: "${slug}"
    kicker: "Chapter"
    subtitle: ""
    ---

    EOF
    echo "created $file"

# Word count per chapter plus the total (prose only).
wordcount:
    @wc -w content/chapters/*.md content/_index.md | sort -n

# List chapters in publish order (by weight).
chapters:
    @grep -H -e '^weight:' -e '^title:' content/chapters/*.md

# ── Quality ────────────────────────────────────────────────────────────────

# Fail the build on broken refs/links and other Hugo warnings (CI-grade check).
check:
    hugo --gc --minify --panicOnWarning --printPathWarnings

# Scan the working tree for secrets before committing (Vulnetix skill).
secret-scan:
    @echo "Run /vulnetix:secret-scan in Claude Code, or:" \
     && echo "  git diff --staged | grep -nE '(AKIA|ghp_|xox[baprs]-|sk_live_)' || echo clean"

# ── Deploy (GitHub Pages) ──────────────────────────────────────────────────

# Trigger the Pages deploy workflow manually (normally runs on push to main).
deploy:
    gh workflow run deploy.yml --repo {{repo}}

# Watch the most recent deploy run to completion.
deploy-status:
    gh run watch --repo {{repo}} $(gh run list --repo {{repo}} --workflow deploy.yml --limit 1 --json databaseId --jq '.[0].databaseId')

# List recent deploy runs.
deploy-log:
    gh run list --repo {{repo}} --workflow deploy.yml --limit 10

# Open the published site in a browser.
open:
    @echo "https://{{domain}}/" && (xdg-open "https://{{domain}}/" 2>/dev/null || open "https://{{domain}}/" 2>/dev/null || true)

# Confirm GitHub Pages is bound to the custom domain with HTTPS enforced.
pages-domain:
    gh api -X PUT repos/{{repo}}/pages -f cname='{{domain}}' -F https_enforced=true

# ── DNS (Terraform / Cloudflare) ───────────────────────────────────────────
# Credentials (api_token, zone_id, account_id) live in the gitignored
# terraform/terraform.tfvars. Copy terraform.tfvars.example to start.

# Initialise the Terraform working directory.
dns-init:
    cd terraform && terraform init

# Show the DNS change plan.
dns-plan:
    cd terraform && terraform plan

# Apply the DNS records (prompts for confirmation).
dns-apply:
    cd terraform && terraform apply

# Format and validate the Terraform config.
dns-check:
    cd terraform && terraform fmt -recursive && terraform validate

# ── Info ───────────────────────────────────────────────────────────────────

# Print tool versions; warn if local Hugo drifts from the CI pin.
versions:
    @hugo version
    @echo "CI pins Hugo {{hugo_version}} (.github/workflows/deploy.yml)"
    @terraform version 2>/dev/null | head -1 || true
