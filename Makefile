.PHONY: all clean

BIBS=$(shell ls *.bib)
DEPENDS=$(shell ls *.tex)
NAME=shplonk
all: rubber

rubber: $(NAME).tex $(DEPENDS) $(BIBS)
	rubber -vv --pdf $(NAME).tex

pdflatex: $(NAME).tex $(DEPENDS) $(BIBS)
	pdflatex $(NAME).tex $(DEPENDS)
	bibtex $(NAME)
	pdflatex $(NAME).tex $(DEPENDS)
	pdflatex $(NAME).tex $(DEPENDS)

open:
	pkill Preview || true && open $(NAME).pdf

clean:
	rm -rf *.aux *.bbl *.blg *.log *.pdf *.toc *.snm *.out *.nav *.dvi *.lb *.fdb_latexmk *.fls tags auto

two:
	make all
	cp $(NAME).pdf $(NAME)_copy.pdf
