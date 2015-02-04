# Makefile for creating an ATLAS paper draft using journal classes

TEXLIVE  = 2013
LATEX    = latex
PDFLATEX = pdflatex
BIBTEX   = bibtex
DVIPS    = dvips
DVIPDF   = dvipdf
OPEN     = open

TEXFILES = $(wildcard *.tex)

.PHONY: texlive clean

all: atlas-elsevier atlas-jhep atlas-revtex

texlive:
	for file in $(TEXFILES); do \
	  sed -i'.bak' 's/texlive=20[0-9][0-9]/texlive=$(TEXLIVE)/' $$file; \
	done

atlas-elsevier: atlas-elsevier.pdf
	@echo "Made $<"
	# $(OPEN) $<

atlas-jhep: atlas-jhep.pdf
	@echo "Made $<"
	# $(OPEN) $<

atlas-revtex: atlas-revtex.pdf
	@echo "Made $<"
	# $(OPEN) $<

run_latex: $(BASENAME).dvi
	$(DVIPDF) -sPAPERSIZE=a4 -dPDFSETTINGS=/prepress $<
	@echo "Made $< and $(basename $<).pdf"

# Standard LaTeX targets
%.pdf: %.tex *.bib
	$(PDFLATEX) $<
	-$(BIBTEX)  $(basename $<)
	$(PDFLATEX) $<
	$(PDFLATEX) $<

%.dvi: $(BASENAME).tex
	$(LATEX)    $<
	$(LATEX)    $<

clean:
	-rm *.dvi *.toc *.aux *.log *.out *.blg *.bbl *.bcf \
	 *.spl *-revtexNotes.bib *.run.xml *.synctex.gz *~

cleanall: clean
	-rm *.pdf
