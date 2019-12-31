
# put current year here
maxyr <- 2019

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
