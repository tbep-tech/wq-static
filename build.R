tinytex::install_tinytex()
tinytex::tlmgr_install(c("a4wide", "adjustbox", "ae", "algorithm2e", "algorithms", "amscls", "amsfonts", "amsmath", "animate", "apacite", "appendix", "babel", "babel-english", "babelbib", "bbm-macros", "beamer", "biblatex", "bibtex", "blkarray", "booktabs", "boondox", "breakurl", "caption", "carlisle", "ccaption", "changepage", "chemgreek", "cite", "cleveref", "cm", "collectbox", "collection-basic", "collection-latex", "colortbl", "comment", "courier", "csquotes", "ctable", "datetime", "diagbox", "doi", "doublestroke", "draftwatermark", "dvipdfmx", "dvips", "dvisvgm", "ec", "enctex", "enumitem", "environ", "eso-pic", "etex", "etex-pkg", "etoolbox", "euenc", "eurosym", "everypage", "fancybox", "fancyhdr", "fancyvrb", "fix2col", "float", "floatrow", "fmtcount", "fontspec", "footmisc", "fp", "fpl", "framed", "geometry", "glyphlist", "graphics", "graphics-cfg", "graphics-def", "gsftopk", "hardwrap", "harvard", "helvetic", "hyperref", "hyph-utf8", "hyphen-base", "ifluatex", "ifmtarg", "iftex", "ifxetex", "inconsolata", "jknapltx", "kastrup", "kerkis", "knuth-lib", "knuth-local", "koma-script", "kpathsea", "l3experimental", "l3kernel", "l3packages", "lastpage", "latex", "latex-bin", "latex-fonts", "latexconfig", "lineno", "lipsum", "listings", "lm", "logreq", "ltxmisc", "lua-alt-getopt", "luatex", "makeindex", "manfnt", "marvosym", "mathabx", "mathpazo", "mathspec", "mathtools", "mdwtools", "memoir", "metafont", "metalogo", "mflogo", "mfnfss", "mfware", "mhchem", "microtype", "morefloats", "mptopdf", "ms", "multirow", "natbib", "newtx", "nextpage", "ntgclass", "ntheorem", "oberdiek", "palatino", "paralist", "parskip", "pbox", "pdfcrop", "pdfpages", "pdftex", "pgf", "picinpar", "pict2e", "placeins", "plain", "preprint", "preview", "pslatex", "psnfss", "pspicture", "realscripts", "relsize", "rsfs", "sauerj", "scheme-basic", "scheme-infraonly", "scheme-minimal", "sectsty", "setspace", "shadethm", "siunitx", "soul", "stmaryrd", "subfig", "subfigure", "symbol", "tabu", "tabulary", "tetex", "tex", "tex-ini-files", "tex4ht", "texconfig", "texlive-common", "texlive-docindex", "texlive-en", "texlive-msg-translations", "texlive-scripts", "texlive.infra", "textcase", "threeparttable", "thumbpdf", "times", "tipa", "titlesec", "titling", "tocbibind", "tocloft", "todonotes", "tools", "trimspaces", "tufte-latex", "txfonts", "ucs", "ulem", "underscore", "unicode-data", "updmap-map", "upquote", "url", "varwidth", "vmargin", "wrapfig", "xargs", "xcolor", "xcomment", "xdvi", "xetex", "xetexconfig", "xifthen", "xkeyval", "xltxtra", "xstring", "xtab", "xunicode", "zapfchan", "zapfding"))

# put current year here
maxyr <- 2020

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
