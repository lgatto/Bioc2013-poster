LATEXFILES = *.aux\
	*.snm\
	*.nav\
	*.vrb\
	*.bbl\
	*.blg\
	*.ilg\
	*.log\
	*.nlo\
	*.nls\
	*.toc\
	*.aux\
	Rplots.pdf\
	*.dvi\
	*.map\
	*.out\
	*.figlist\
	*.dep\
	*.dpth\
	*.makefile

all: 
	make poster

setvars:
ifeq (${R_HOME},)
R_HOME= $(shell R RHOME)
endif

poster: Bioc2013_poster.Rnw
	"$(R_HOME)/bin/R" --vanilla -e "knitr::knit2pdf('Bioc2013_poster.Rnw')"
	## bibtex Bioc2013_poster
	## pdflatex Bioc2013_poster.tex
	pdflatex Bioc2013_poster.tex

.PHONY: clean allclean 

clean:	
	rm -f $(LATEXFILES)
	rm -f .Rhistory
	rm -f *~
	rm -f */*~


