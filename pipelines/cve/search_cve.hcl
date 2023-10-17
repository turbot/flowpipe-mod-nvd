pipeline "search_cve" {
  title       = "Search a CVE with a word or phrase"
  description = "Search a CVE with a word or phrase found in the current description."

  param "keyword_search" {
    type = string
  }

  step "http" "search_cve" {
    title  = "Search a CVE with a word or phrase"
    method = "get"
    url    = "https://services.nvd.nist.gov/rest/json/cves/2.0?keywordSearch=${param.keyword_search}&resultsPerPage=20&noRejected"

    request_headers = {
      Content-Type = "application/json"
    }
  }

  output "response_body" {
    value = step.http.search_cve.response_body
  }
  output "response_headers" {
    value = step.http.search_cve.response_headers
  }
  output "status_code" {
    value = step.http.search_cve.status_code
  }
}
