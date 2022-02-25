# README

[![build](https://github.com/tbep-tech/wq-static/workflows/build/badge.svg)](https://github.com/tbep-tech/wq-static/actions)

Repository for building static water quality reporting tool documents. 

## Updating report card with provisional Nov/Dec data in January

For this repository:

1. First week of jan, request Nov/Dec provisional water quality data for HB, OTB, LTB, MTB from EPC (SM)
1. Take downloaded data from wq-static CI build ('Results_Updated.xls') and copy in provisional data from EPC
1. Check if all data present, should be 10 samples in HB, 8 in LTB, 12 in MTB, 15 in OTB
1. Save new file, 'Results_Provisional.xlsx' (okay to save as new file format), in data-raw folder
1. In wq1.Rnw comment lines 61, 65, uncomment lines 60, 64
1. In wq2.Rnw comment lines 59, 63, uncomment lines 58, 62
1. Run build.R
1. Comment lines 1-7 on .github/workflows/build.yaml to disable CI 
1. Update text and any other static graphics

Updating the wq dashboard with provisional data (wq-dash repo):

1. After the data are updated on the wq-static repo, save the epcdata RData object created on line 61 of wq1.Rnw to the wq-dash repo data folder 
1. Convert the `sq_q` column in epcdata to logical, as in line 12 in R/dat_build.R, save epcdata again to data folder
1. In wq-dash.Rmd, comment line 42, uncomment line 41, change line 41 to current year
1. In R/dat_proc.R, comment line 14, uncomment line 13, change line 20 to current year, run R/dat_proc.R
1. In R/dat_build.R, comment lines 6 - 20 so CI actions don't overwrite epcdata

Note that once the Nov/Dec data are no longer provisional (on EPC FTP), undo the above, set maxyr as next year.  For next year's provisional report card, this can only be done once January data are available. 