pipeline "list_cves" {
  title       = "List CVEs."
  description = "List of Common Vulnerabilities and Exposures (CVE) in the last 30 days."

  param "start_date" {
    type    = string
    description = "Date range from the current timestamp."
    default = timeadd(timestamp(), "-720h")
  }

  param "end_date" {
    type    = string
    description = "The current timestamp."
    default = timestamp()
  }

  step "http" "list_cves" {
    method = "get"
    url    = "https://services.nvd.nist.gov/rest/json/cves/2.0/?pubStartDate=${param.start_date}&pubEndDate=${param.end_date}&noRejected&resultsPerPage=200&startIndex=0"

    request_headers = {
      Content-Type = "application/json"
    }

    loop {
      until = result.response_body.resultsPerPage + result.response_body.startIndex == result.response_body.totalResults
      url   = "https://services.nvd.nist.gov/rest/json/cves/2.0/?pubStartDate=${param.start_date}&pubEndDate=${param.end_date}&noRejected&resultsPerPage=200&startIndex=${result.response_body.resultsPerPage + result.response_body.startIndex}"
    }
  }

  output "vulnerabilities" {
    description = "List of vulnerabilities."
    value       = flatten([for page, vulnerabilities in step.http.list_cves : vulnerabilities.response_body.vulnerabilities])
  }
}