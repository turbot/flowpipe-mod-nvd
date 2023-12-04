pipeline "get_cve" {
  title       = "Get CVE"
  description = "Get details of a Common Vulnerabilities and Exposures (CVE) by the CVE ID."

  param "cve_id" {
    type        = string
    description = "The CVE ID to retrieve."
  }

  step "http" "get_cve" {
    method = "get"
    url    = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=${param.cve_id}"

    request_headers = {
      Content-Type = "application/json"
    }
  }

  output "vulnerability" {
    value = step.http.get_cve.response_body
  }
}
