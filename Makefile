# This Makefile is taken from the following discussion on tex.stackoverflow
# http://tex.stackexchange.com/questions/40738/how-to-properly-make-a-latex-project
######################################################################

MAIN = main
SRC = ./config/*.tex ./tex/*.tex $(MAIN).tex
IMG = ./img/*
BIB = *.bib

# The first rule in a Makefile is the one executed by default ("make"). It
# should always be the "all" rule, so that "make" and "make all" are identical.
all: $(MAIN).pdf

# CUSTOM BUILD RULES

# In case you didn't know, '$@' is a variable holding the name of the target,
# and '$<' is a variable holding the (first) dependency of a rule.
# "raw2tex" and "dat2tex" are just placeholders for whatever custom steps
# you might have.

%.tex: %.raw
	./raw2tex $< > $@

%.tex: %.dat
	./dat2tex $< > $@

# MAIN LATEXMK RULE

# -pdf tells latexmk to generate PDF directly (instead of DVI).
# -pdflatex="" tells latexmk to call a specific backend with specific options.
# -use-make tells latexmk to call make for generating missing files.

# -interactive=nonstopmode keeps the pdflatex backend from stopping at a
# missing file reference and interactively asking you for an alternative.

$(MAIN).pdf: $(SRC) $(IMG) $(BIB)
	latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make $(MAIN).tex

html: $(SRC) $(IMG) $(BIB)
	htlatex $(MAIN).tex "html,2,info"
	# produces 2-level html files
	# (https://www.tug.org/applications/tex4ht/mn-commands.html)

clean:
	latexmk -CA

clean-all: cleanpdf cleanhtml
	\rm -f *.fdb_latexmk *.fls

cleanpdf:
	\rm -f *bbl *pdf *log *aux *gz *lof *lot *out *toc *dvi

cleanhtml:
	\rm -f *ct *tc *tmp *xref *html *idv *lg *css
