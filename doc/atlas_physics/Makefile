#------------------------------------------------------------------------------
# Makefile to make atlas-physics documentation
#------------------------------------------------------------------------------

.PHONY: clean cleanpdf

BASENAME = atlas_physics

all:
	make -f ../Makefile BASENAME=$(BASENAME)

clean:
	make -f ../Makefile clean
	
cleanpdf:
	-rm $(BASENAME).pdf

cleanall: clean
	-rm $(BASENAME).pdf
