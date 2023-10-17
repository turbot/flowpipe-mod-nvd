// https://nvd.nist.gov/developers/api-workflows
pipeline "list_cves" {
  title       = "List 20 CVEs in last 120 days."
  description = "List of 20 Common Vulnerabilities and Exposures (CVE) in the last 120 days."

  param "start_date" {
    type    = string
    default = timeadd(timestamp(), "-2880h")
  }

  param "end_date" {
    type    = string
    default = timestamp()
  }

  step "http" "list_cves" {
    title  = "List of CVEs for the last 120 days."
    method = "get"
    url    = "https://services.nvd.nist.gov/rest/json/cves/2.0/?pubStartDate=${param.start_date}&pubEndDate=${param.end_date}&noRejected&resultsPerPage=20"

    request_headers = {
      Content-Type = "application/json"
    }
  }

  output "response_body" {
    value = step.http.list_cves.response_body
  }
  output "response_headers" {
    value = step.http.list_cves.response_headers
  }
  output "status_code" {
    value = step.http.list_cves.status_code
  }

}
