pipeline "search_cve_by_keyword" {
  title       = "Search CVE by Keyword"
  description = "Search a CVE with a keyword or phrase found in the current description."

  param "keyword" {
    type        = string
    description = "The keyword or phrase to search for in the CVE description."
  }

  step "http" "search_cve_by_keyword" {
    method = "get"
    url    = "https://services.nvd.nist.gov/rest/json/cves/2.0?keywordSearch=${param.keyword}&resultsPerPage=2000&noRejected"

    request_headers = {
      Content-Type = "application/json"
    }
  }

  output "vulnerabilities" {
    description = "List of vulnerabilities that matches with the search keyword."
    value = step.http.search_cve_by_keyword.response_body
  }
}
