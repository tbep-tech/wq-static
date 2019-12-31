
# knit front, convert to pdf
knitr::knit('wq1.Rnw', 'wq1.tex')
tinytex::pdflatex('wq1.tex')

# knit back, convert to pdf
knitr::knit('wq2.Rnw', 'wq2.tex')
tinytex::pdflatex('wq2.tex')

# combine into single page
pdftools::pdf_combine(c('wq1.pdf', 'wq2.pdf'), 'wq.pdf')
