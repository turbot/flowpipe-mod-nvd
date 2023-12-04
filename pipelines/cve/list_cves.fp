# https://nvd.nist.gov/developers/api-workflows
pipeline "list_cves" {
  title       = "List 20 CVEs."
  description = "List of 20 Common Vulnerabilities and Exposures (CVE) in the last 120 days."

  param "start_date" {
    type    = string
    default = timeadd(timestamp(), "-24h")
  }

  param "end_date" {
    type    = string
    default = timestamp()
  }

  step "http" "list_cves" {
    method = "get"
    url    = "https://services.nvd.nist.gov/rest/json/cves/2.0/?pubStartDate=${param.start_date}&pubEndDate=${param.end_date}&noRejected&resultsPerPage=2000&startIndex=0"

    request_headers = {
      Content-Type = "application/json"
    }

    loop {
      until = result.response_body.resultsPerPage + result.response_body.startIndex == result.response_body.totalResults
      url   = "https://services.nvd.nist.gov/rest/json/cves/2.0/?pubStartDate=${param.start_date}&pubEndDate=${param.end_date}&noRejected&resultsPerPage=2000&startIndex=${result.response_body.resultsPerPage + result.response_body.startIndex}"
    }
  }

  output "vulnerabilities" {
    description = "List of vulnerabilities."
    value       = flatten([for page, vulnerabilities in step.http.list_cves : vulnerabilities.response_body.vulnerabilities])
  }
}