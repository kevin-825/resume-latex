# PDF Generation via Docker (texlive)
PDF_ENGINE=pdflatex
SOURCE=main.tex
OUTPUT=resume.pdf

all:
	docker run --rm -v $(PWD):/workdir texlive/texlive $(PDF_ENGINE) $(SOURCE)

clean:
	rm -f *.aux *.log *.out $(OUTPUT)
