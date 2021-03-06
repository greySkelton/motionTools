#redcap.R

#' Read data from a REDCap report.
#' Arguments are as supplied in API playground.
#'
#' The API token should be stored in the user's .Renviron file.
#'
#' Additional arguments to read_csv() (e.g., guess_max = 2000) can be passed as inputs.
#'
#' @export
ReadRedcapReport = function(
  token,
  url = "https://redcap.emory.edu/api/",
  report_id = '29228',
  format='csv',
  csvDelimiter='',
  rawOrLabel='raw',
  rawOrLabelHeaders='raw',
  exportCheckboxLabel='false',
  returnFormat='json',
  ...
  )
{
  form.data <- list(token=token,
                    content='report',
                    format=format,
                    report_id=as.character(report_id),
                    csvDelimiter=csvDelimiter,
                    rawOrLabel=rawOrLabel,
                    rawOrLabelHeaders=rawOrLabelHeaders,
                    exportCheckboxLabel=exportCheckboxLabel,
                    returnFormat=returnFormat
  )
  response <- httr::POST(url, body = form.data, encode = "form")
  readr::read_csv(httr::content(response,as="text"),...)
}

