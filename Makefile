# Search path for LaTeX: Look in current dir, then in /workdir/sections
export TEXINPUTS := .:/workdir/sections:

# Use $(CURDIR) instead of $(PWD) for CI/CD compatibility
DOCKER_FLAGS = --rm -v $(CURDIR):/workdir -e TEXINPUTS=$(TEXINPUTS)

# The Image
IMAGE = texlive/texlive

.PHONY: classic modern all clean

all: classic modern

classic:
	docker run $(DOCKER_FLAGS) -w /workdir/templates/classic $(IMAGE) pdflatex main.tex
	mv templates/classic/main.pdf ./kevin_aimaier_classic.pdf

modern:
	@mkdir -p templates/modern
	docker run $(DOCKER_FLAGS) -w /workdir/templates/modern $(IMAGE) pdflatex main.tex
	mv templates/modern/main.pdf ./kevin_aimaier_modern.pdf

clean:
	find . -name "*.aux" -o -name "*.log" -o -name "*.out" | xargs rm -f
	rm -f *.pdf