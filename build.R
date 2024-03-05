
# put current year here
maxyr <- 2024

# input maxyr into wq1, knit, convert to pdf
wq1 <- readLines('wq1.Rnw')
torepl <- grepl('^maxyr', wq1)
wq1[torepl] <- paste0('maxyr <- ', maxyr)
writeLines(wq1, 'wq1.Rnw')
knitr::knit('wq1.Rnw', 'wq1.tex')
tinytex::pdflatex('wq1.tex')

# input maxyr into wq2, knit, convert to pdf
wq2 <- readLines('wq2.Rnw')
torepl <- grepl('^maxyr', wq2)
wq2[torepl] <- paste0('maxyr <- ', maxyr)
writeLines(wq2, 'wq2.Rnw')
knitr::knit('wq2.Rnw', 'wq2.tex')
tinytex::pdflatex('wq2.tex')

# combine into single page
pdftools::pdf_combine(c('wq1.pdf', 'wq2.pdf'), 'wq.pdf')

# clean up intermediates
torm <- list.files(pattern = '^wq1\\.pdf$|^wq2\\.pdf$|\\.nav$|\\.tex$|\\.toc$|\\.xwm$|\\.snm$')
file.remove(torm)

# restore if epc data is not new
unstaged <- unlist(git2r::status()$unstaged)
if(!'data-raw/Results_Updated.xls' %in% unstaged){
  system('git restore .')
  cat('No data update, using git restore')
}