output "apex_a_records" {
  description = "Apex A records created for GitHub Pages."
  value       = [for r in cloudflare_dns_record.apex_a : "${r.name} A ${r.content}"]
}

output "apex_aaaa_records" {
  description = "Apex AAAA records created for GitHub Pages."
  value       = [for r in cloudflare_dns_record.apex_aaaa : "${r.name} AAAA ${r.content}"]
}

output "www_record" {
  description = "The www CNAME, if managed."
  value       = var.manage_www ? "${cloudflare_dns_record.www[0].name} CNAME ${cloudflare_dns_record.www[0].content}" : null
}
