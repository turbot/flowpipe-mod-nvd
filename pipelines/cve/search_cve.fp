pipeline "search_cve" {
  title       = "Search CVE"
  description = "Search a CVE with a word or phrase found in the current description."

  param "keyword_to_search" {
    type        = string
    description = "The word or phrase to search for in the CVE description."
  }

  step "http" "search_cve" {
    method = "get"
    url    = "https://services.nvd.nist.gov/rest/json/cves/2.0?keywordSearch=${param.keyword_to_search}&resultsPerPage=20&noRejected"

    request_headers = {
      Content-Type = "application/json"
    }
  }

  output "vulnerabilities" {
    value = step.http.search_cve.response_body
  }
}
