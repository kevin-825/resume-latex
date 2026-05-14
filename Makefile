# Usage: 
#   make classic  <- Builds only the classic template
#   make modern   <- Builds only the modern template
#   make all      <- Builds everything

# The ':' at the end is CRITICAL—it tells LaTeX to append the default paths
export TEXINPUTS := .:/workdir/sections:

DOCKER_BASE = docker run --rm -v $(PWD):/workdir -e TEXINPUTS=$(TEXINPUTS)
# The Image (The "Environment")
IMAGE = texlive/texlive

.PHONY: classic modern all clean

all: classic modern

classic:
	# Run pdflatex INSIDE the template folder within the container
	$(DOCKER_BASE) -w /workdir/templates/classic $(IMAGE) pdflatex main.tex
	mv templates/classic/main.pdf ./kevin_aimaier_classic.pdf

modern:
	$(DOCKER_BASE) -w /workdir/templates/modern $(IMAGE) pdflatex main.tex
	mv templates/modern/main.pdf ./kevin_aimaier_modern.pdf

clean:
	find . -name "*.aux" -o -name "*.log" -o -name "*.out" | xargs rm -f
	rm -f *.pdf
