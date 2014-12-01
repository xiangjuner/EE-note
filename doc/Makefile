# Makefile for creating documentation for ATLAS LaTeX
# Usually called from a subdirectory

LATEX    = latex
PDFLATEX = pdflatex
BIBTEX   = biber
DVIPS    = dvips
DVIPDF   = dvipdf

.PHONY: clean cleanpdf

BASENAME = dummy

run_pdflatex: $(BASENAME).pdf
	@echo "Made $<"

run_latex: $(BASENAME).dvi
	$(DVIPDF) -sPAPERSIZE=a4 -dPDFSETTINGS=/prepress $<
	@echo "Made $< and $(basename $<).pdf"

# Standard LaTeX targets
$(BASENAME).pdf: $(BASENAME).tex *.bib
	$(PDFLATEX) $<
	-$(BIBTEX)  $(basename $<)
	$(PDFLATEX) $<
	$(PDFLATEX) $<

$(BASENAME).dvi: $(BASENAME).tex *.bib
	$(LATEX)    $<
	-$(BIBTEX)  $(basename $<)
	$(LATEX)    $<
	$(LATEX)    $<

%.bbl: %.tex *.bib
	$(PDFLATEX) $*
	$(BIBTEX) $*

clean:
	-rm *.dvi *.toc *.aux *.log *.out *.blg *.bbl *.bcf *-blx.bib \
	 *.run.xml *.synctex.gz *~
	 
cleanpdf:
	-rm $(BASENAME).pdf
