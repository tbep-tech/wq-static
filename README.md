# README

[![build](https://github.com/tbep-tech/wq-static/workflows/build/badge.svg)](https://github.com/tbep-tech/wq-static/actions)

Repository for building static water quality reporting tool documents. 

## Updating report card with provisional Nov/Dec data in January

### For this repository:

1. First week of jan, request Nov/Dec provisional water quality data for HB, OTB, LTB, MTB from EPC (SM)
1. Take downloaded data from wq-static CI build ('Results_Updated.xls') and copy in provisional data from EPC
1. Check if all data present, should be 10 samples in HB, 8 in LTB, 12 in MTB, 15 in OTB
1. Save new file, 'Results_Provisional.xlsx' (okay to save as new file format), in data-raw folder
1. In wq1.Rnw comment lines 63, 67, uncomment lines 62, 66, make sure line 69 is F
1. In wq2.Rnw comment lines 61, 65, uncomment lines 60, 64, make sure line 67 is F
1. In wq2.Rnw change dates and report numbers to xx-curyr on line 173
1. Run build.R through line 27
1. Comment lines 6-7, 19-56 on .github/workflows/build.yaml to disable CI (w/o error)
1. Update text and any other static graphics

### Updating the wq dashboard with provisional data (wq-dash repo):

1. After the data are updated on the wq-static repo, save the epcdata RData object created on line 67 of wq1.Rnw to the wq-dash repo data folder 
1. Convert the `sq_q` column in epcdata to logical, as in line 12 in R/dat_build.R, save epcdata again to data folder
1. In R/global.R, comment line 10, uncomment line 9, change line 19 to current year
1. In R/dat_proc.R, comment line 14, uncomment line 13, change line 20 to current year, run R/dat_proc.R
1. In R/dat_build.R, comment lines 6 - 20 so CI actions don't overwrite epcdata

### Updating state of the bay (state of the bay repo): 

1. Copy 'Results_Provisional.xlsx' to state of the bay repo data-raw folder
1. In docs/water-quality-decision-matrix.Rmd, comment lines 13, 18, uncomment lines 14, 17, change line 10 to current year
1. Knit docs/water-quality-decision-matrix.Rmd and verify changes

### Reverting 

Once the Nov/Dec data are no longer provisional (on EPC FTP), undo the above, set maxyr as next year.  For next year's provisional report card, this can only be done once January data are available.  Also make sure line 69 in wq1.Rnw and line 67 in wq2.Rnw is T for partialyr.  Also uncomment line 63 and comment line 62 in wq1.Rnw and uncomment line 61 and comment line 60 in wq2.Rnw.