pipeline "search_cve_by_exactmatch" {
  title       = "Search CVE by Exact Keyword Match"
  description = "Search a CVE with a keyword or phrase which matches exactly in the current description."

  param "keyword_exactmatch" {
    type        = string
    description = "The exact matching keyword or phrase to search for in the CVE description."
  }

  step "http" "search_cve_by_exactmatch" {
    method = "get"
    url = "https://services.nvd.nist.gov/rest/json/cves/2.0?keywordSearch=${urlencode(param.keyword_exactmatch)}&keywordExactMatch&resultsPerPage=2000&noRejected"

    request_headers = {
      Content-Type = "application/json"
    }
  }

  output "vulnerabilities" {
    value = step.http.search_cve_by_exactmatch.response_body
  }
}
