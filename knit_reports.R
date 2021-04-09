library(tidyverse)

# Create our table of report parameters. You might read this from a file, or create it some other way in your code.
stocks <- tribble(
  ~symbol, ~startdate, ~endDate,
  "GOOG", "2010-01-01", "2021-04-06", 
  "NFLX", "2015-07-01", "2021-04-06", 
  "TSLA", "2010-06-29", "2020-12-31", 
  "AAPL", "2008-01-01", "2018-12-31",
  "MSFT", "2015-01-01", "2019-12-31"
)

# Now we can loop through the rows of our table, calling render() from the rmarkdown package for each row and saving the output.
for (i in 1:nrow(stocks)) {
  rmarkdown::render(input = "template.Rmd",
                    output_format = "html_document",
                    params = stocks[i,],
                    output_file = paste0("reports/", stocks[i, "symbol"], ".html"))
}